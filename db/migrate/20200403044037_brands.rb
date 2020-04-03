class Brands < ActiveRecord::Migration[5.2]
  def change
    drop_table :brands
  end
end
