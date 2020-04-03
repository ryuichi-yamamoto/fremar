class Item < ApplicationRecord

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
  validates :prefecture,  presence: true
  validates :deliveryfee, presence: true
  validates :deliveryday, presence: true
  validates :status,      presence: true
  validates_associated :images
  validates :images, presence: true

end
