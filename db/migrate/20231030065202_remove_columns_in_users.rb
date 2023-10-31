class RemoveColumnsInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :height, :integer
    remove_column :users, :weight, :integer
  end
end
