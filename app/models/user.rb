class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many   :items
  has_many   :comments
  has_many   :cards
  has_many   :sns_credentials
  has_one    :addresses

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nickname,                                 presence: true, length: { maximum: 40 }
  validates :email,                                    presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }  
  validates :password,                                 presence: true, length: { minimum: 7 }
  validates :status,                                   presence: true
  validates :first_name, :last_name,                   presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "no" }
  validates :first_name_hiragana, :last_name_hiragana, presence: true, format: { with: /\A([ぁ-ん]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
  validates :birth_year,                               presence: true, format: { with: /\A\d{4}\z/, message: "no" }
  validates :birth_month,                              presence: true, format: { with: /\A\d{2}\z/, message: "no" }
  validates :birth_day,                                presence: true, format: { with: /\A\d{2}\z/, message: "no" }

end
