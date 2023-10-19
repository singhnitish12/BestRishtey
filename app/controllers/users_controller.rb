# app/controllers/users_controller.rb

class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
  
    def show
      # @user is already set by the before_action
    end
  
   
  
    def edit
      # @user is already set by the before_action
    end
  
    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
        params.require(:user).permit(
          :first_name, :last_name, :contact_number, :address, :username, :email, :password, :password_confirmation,
          :dob, :father_name, :mother_name, :religion, :cast, :marital_status, :height, :weight,
          :highest_qualification, :job_packages, :job_designation, :job_location,:profile_image,:mother_tongue
        )
      end
  end
  