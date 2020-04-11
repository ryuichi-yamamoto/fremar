class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to_active_hash :deliveryfee
  belongs_to_active_hash :deliveryday
  has_many   :images, dependent: :destroy
  has_many   :comments
  belongs_to :user,     optional: true
  belongs_to :brand,    optional: true
  belongs_to :category, optional: true, foreign_key: 'category_id'
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name,           presence: true
  validates :price,          presence: true
  validates :text,           presence: true
  validates :size,           presence: true
  validates :prefecture_id,  presence: true
  validates :deliveryfee_id, presence: true
  validates :deliveryday_id, presence: true
  validates :status_id,      presence: true
  validates_associated :images
  validates :images,      presence: true
  validates :user_id,     presence: true
  validates :category_id, presence: true
  validates :condition,   presence: true

  def self.search(search)
    if search
      Item.where(['name LIKE(?) OR text LIKE(?) OR brandname LIKE(?)', "%#{search}%","%#{search}%","%#{search}%"])
    else
      Item.all
    end
  end

end
