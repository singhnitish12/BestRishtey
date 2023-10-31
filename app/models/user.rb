class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, 
  #        :recoverable, :rememberable, :validatable
  
  enum role: { user: 0, admin: 1 }
  #attr_accessor :first_name, :dob
  # before_validation :calculate_and_set_age, on: :create
  # before_validation :generate_unique_code, on: :create
  
  before_validation :calculate_and_set_age, on: :create
  before_validation :generate_unique_code, on: :create
  after_create :after_confirmation
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable 
         
        
  validates :username, presence: true, uniqueness: true
  has_one_attached :avatar

  
  attr_accessor :login
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :dob, presence: true
  validate :dob_should_be_greater_than_18_years
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :contact_number, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 1000 }
  
  
  def profile_completion_percentage
    mandatory_sections = 6 # Adjust based on your criteria
    completed_sections = 0

    completed_sections += 1 if self.account_completed?
    completed_sections += 1 if self.personal_details_completed?
    completed_sections += 1 if self.family_details_completed?
    completed_sections += 1 if self.contact_details_completed?
    completed_sections += 1 if self.description_completed?
    completed_sections += 1 if self.profile_photo_uploaded?

    # Calculate the percentage
    (completed_sections / mandatory_sections.to_f) * 100
  end

  def account_completed?
    email.present? && encrypted_password.present? && username.present?
  end
  def personal_details_completed?
    first_name.present? && dob.present? && religion.present? && highest_qualification.present? && job_packages.present?
  end
  def family_details_completed?
    family_type.present? && family_lives_in.present? 
  end
  def contact_details_completed?
    contact_number.present? && address.present? && alternate_contact_number.present?
  end
  def description_completed?
    description.present?
  end
  def profile_photo_uploaded?
    avatar.attached?
  end




  def login
    @login || self.username || self.email
  end


  private
  def dob_should_be_greater_than_18_years
    if dob.present? && dob > 18.years.ago.to_date
      errors.add(:dob, "should be greater than 18 years ago")
    end
  end

  def calculate_and_set_age
    # Calculate the age in years
    self.age = (Date.current - dob).to_i / 365
  end

  def generate_unique_code
    return if unique_id.present? # Skip if unique_id is already set

    dob_date = dob 
    self.unique_id = "#{first_name&.first(4)&.downcase}#{dob_date&.year.to_s}"
   rescue ArgumentError
    # Handle invalid date format
    errors.add(:dob, 'has an invalid date format')
  end

  def after_confirmation
    WelcomeMailer.send_greetings_notification(self).deliver
  end

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    if(login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
