class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :after_registration_path]
  def index  
  end

  def after_registration_path
  end
end
