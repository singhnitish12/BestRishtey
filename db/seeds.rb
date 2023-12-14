require 'faker'

# Clear existing data
# User.destroy_all

# Helper method to generate a random date of birth within a given range
def random_date_of_birth(from: 30.years.ago, to: 18.years.ago)
  Faker::Date.between(from: from, to: to)
end

# Helper method to generate a random marital status
def random_marital_status
  ['Unmarried', 'Divorced'].sample
end

# Helper method to generate a random dietary habit
def random_dietary_habit
  ['Vegetarian', 'Non-vegetarian', 'Vegan'].sample
end

# Helper method to generate a random family type
def random_family_type
  ['Nuclear', 'Joint'].sample
end

# Generate 100 dummy profiles
100.times do
  user = User.new(
    email: Faker::Internet.email,
    created_at: Time.current,
    updated_at: Time.current,
    password: 'password', # Set a default password for simplicity
    password_confirmation: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    contact_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address,
    username: Faker::Internet.username,
    dob: random_date_of_birth,
    father_name: Faker::Name.first_name,
    mother_name: Faker::Name.first_name,
    religion: Faker::Lorem.word,
    cast: Faker::Lorem.word,
    height: Faker::Number.between(from: 150, to: 190),
    weight: Faker::Number.between(from: 40, to: 120),
    highest_qualification: Faker::Lorem.word,
    job_packages: Faker::Lorem.word,
    job_location: Faker::Address.city,
    mother_tongue: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
    age: Faker::Number.between(from: 18, to: 99),
    marital_status: random_marital_status,
    job_designation: Faker::Lorem.word,
    gotra: Faker::Lorem.word,
    bio: Faker::Lorem.paragraph,
    dietary_habit: random_dietary_habit,
    family_type: random_family_type,
    family_lives_in: Faker::Address.city,
    country: Faker::Address.country,
    state: Faker::Address.state,
    city: Faker::Address.city,
    siblings: Faker::Number.between(from: 0, to: 5),
    mothers_occupation: Faker::Lorem.word,
    fathers_occupation: Faker::Lorem.word,
    social_media_id: Faker::Lorem.word,
    alternate_contact_number: Faker::PhoneNumber.phone_number,
    confirmed_at: Time.current
  )

  user.skip_confirmation_notification!
  user.save
end
