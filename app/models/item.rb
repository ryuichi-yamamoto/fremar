class Item < ApplicationRecord

  has_many   :images
  has_many   :comments
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  
end
