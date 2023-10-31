class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gotra, :string
    add_column :users, :dietary_habit, :string
    add_column :users, :family_type, :string
    add_column :users, :family_lives_in, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :siblings, :integer
    add_column :users, :mothers_occupation, :string
    add_column :users, :fathers_occupation, :string
    add_column :users, :bio, :text
    add_column :users, :weight, :float
    add_column :users, :social_media_id, :string
    add_column :users, :alternate_contact_number, :string
    add_column :users, :height, :float
  end
end
