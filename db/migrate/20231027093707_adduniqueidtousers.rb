class Adduniqueidtousers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :unique_id, :string
  end
end
