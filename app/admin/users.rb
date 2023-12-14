
require 'country_select'
ActiveAdmin.register User do
  permit_params :email, :created_at, :updated_at, :first_name, :last_name, :contact_number, :address, :username, :password, :password_confirmation, :dob, :father_name, :mother_name, :religion, :cast , :height, :weight, :highest_qualification, :job_packages, :job_location, :mother_tongue, :description, :age,
  :avatar, :marital_status, :job_designation, :gotra, :bio, :dietary_habit, :family_type, :family_lives_in, :country,
  :state, :city, :siblings, :mothers_occupation,
  :fathers_occupation, :social_media_id, :alternate_contact_number

  index do
    selectable_column
    id_column
   column :email
    column :first_name
    column :last_name
    column :contact_number
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :contact_number
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :age 

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :contact_number
      f.input :address
      f.input :username
      f.input :dob
      f.input :father_name
      f.input :mother_name
      f.input :religion
      f.input :cast
      f.input :height
      f.input :weight
      f.input :highest_qualification
      f.input :job_packages
      f.input :job_location
      f.input :mother_tongue
      f.input :description
      f.input :age
      f.input :avatar
      f.input :marital_status
      f.input :job_designation
      f.input :gotra
      f.input :bio
      f.input :dietary_habit
      f.input :family_type
      f.input :family_lives_in
      f.input :country, as: :country
      f.input :state
      f.input :city
      f.input :siblings
      f.input :mothers_occupation
      f.input :fathers_occupation
      f.input :social_media_id
      f.input :alternate_contact_number
    end
    f.actions
  end

end
