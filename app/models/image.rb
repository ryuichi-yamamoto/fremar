class Image < ApplicationRecord

  belongs_to :item
  mount_uploader :src, ImageUploader
  
  validates :image, presence: true
end
