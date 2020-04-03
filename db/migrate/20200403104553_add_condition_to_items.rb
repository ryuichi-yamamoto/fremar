class AddConditionToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :condition, :integer, :default => 1
  end
end
