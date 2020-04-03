class Item < ApplicationRecord

  has_many   :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many   :comments
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category, foreign_key: 'category_id'
  
  

end
