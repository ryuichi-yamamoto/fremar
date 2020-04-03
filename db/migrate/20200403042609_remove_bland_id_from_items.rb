class RemoveBlandIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :brand_id, :integer
  end
end
