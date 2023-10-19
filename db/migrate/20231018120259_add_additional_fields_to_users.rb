class AddAdditionalFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :dob, :date
    add_column :users, :father_name, :string
    add_column :users, :mother_name, :string
    add_column :users, :religion, :string
    add_column :users, :cast, :string
    add_column :users, :marital_status, :string
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :highest_qualification, :string
    add_column :users, :job, :string
    add_column :users, :job_packages, :integer
    add_column :users, :job_designation, :string
    add_column :users, :job_location, :string
  end
end
