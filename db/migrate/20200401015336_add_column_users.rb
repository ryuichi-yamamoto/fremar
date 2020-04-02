class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname,            :string,   null: false
    add_column :users, :first_name,          :string,   null: false
    add_column :users, :last_name,           :string,   null: false
    add_column :users, :first_name_hiragana, :string,   null: false 
    add_column :users, :last_name_hiragana,  :string,   null: false
    add_column :users, :birth_year,          :string,   null: false
    add_column :users, :birth_month,         :string,   null: false
    add_column :users, :birth_day,           :string,   null: false
    add_column :users, :status,              :string,   null: false
    add_column :users, :deleted_at,          :datetime, null: false
  end
end
