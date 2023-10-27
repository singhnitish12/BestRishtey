class User < ApplicationRecord
  #attr_accessor :first_name, :dob
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
