# app/admin/application_controller.rb
class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :check_admin_role!
  
    def check_admin_role!
      authorize! :read, :dashboard if user_signed_in?
    end
  end
  