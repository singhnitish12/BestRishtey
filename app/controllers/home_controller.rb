class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :after_registration_path]
  def index  
    @users = User.all # Fetch all users (adjust this query based on your needs)
  end

  def after_registration_path
  end
end
