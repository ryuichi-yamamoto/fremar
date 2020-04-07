class Image < ApplicationRecord

  belongs_to :item
  mount_uploader :image, ImageUploader
  def change
    create_table :photos do |t|
      t.string :image
      t.timestamps
    end
  end
end
