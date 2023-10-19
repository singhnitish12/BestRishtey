class RemoveJobAndAddMotherTongueToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :job, :string
    add_column :users, :mother_tongue, :string
  end
end
