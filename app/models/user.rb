class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :items
  has_many :comments
  has_many :cards

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
