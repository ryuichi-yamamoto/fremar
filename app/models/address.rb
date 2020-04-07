class Address < ApplicationRecord

  belongs_to :user, foreign_key: 'user_id'
  
  validates :first_name, :last_name,                   presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "no" }
  validates :first_name_hiragana, :last_name_hiragana, presence: true, format: { with: /\A([ぁ-ん]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
  validates :postal_code,                              presence: true
  validates :prefecture,                               presence: true
  validates :city,                                     presence: true
  validates :address,                                  presence: true
  validates :user_id,                                  presence: true

end 
