class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :price
      t.text    :text
      t.string  :size
      t.integer :prefecture_id,  null: false, foreign_key: true
      t.integer :status_id,      null: false, foreign_key: true
      t.integer :deliveryfee_id, null: false, foreign_key: true
      t.integer :deliveryday_id, null: false, foreign_key: true
      t.integer :user_id,        null: false, foreign_key: true
      t.integer :category_id,    null: false, foreign_key: true
      t.integer :brand_id,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
