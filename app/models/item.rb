class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to_active_hash :deliveryfee
  belongs_to_active_hash :deliveryday
  has_many   :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many   :comments
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category, foreign_key: 'category_id'
  
  validates :name,        presence: true
  validates :price,       presence: true
  validates :text,        presence: true
  validates :size,        presence: true
  validates :prefecture_id,  presence: true
  validates :deliveryfee_id, presence: true
  validates :deliveryday_id, presence: true
  validates :status_id,      presence: true
  validates_associated :images
  validates :images, presence: true

end
