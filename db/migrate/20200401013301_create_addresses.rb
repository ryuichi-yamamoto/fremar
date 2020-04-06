class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :first_name,          null: false
      t.string  :last_name,           null: false
      t.string  :first_name_hiragana, null: false
      t.string  :last_name_hiragana,  null: false
      t.string  :postal_code,         null: false
      t.string  :prefecture,          null: false
      t.string  :city,                null: false
      t.string  :address,             null: false
      t.string  :room
      t.string  :tel,                 unique: true
      t.integer :user_id,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
