# app/controllers/users_controller.rb

class UsersController < ApplicationController
    before_action :authenticate_user!, only: %i[edit_description update_description edit_account update_account edit_personal_details update_personal_details edit_family_details update_family_details edit_contact_details update_contact_details edit_pass update_pass edit_profile_image update_profile_image] 
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    

    def show
      # @user is already set by the before_action
    end
  
   def edit_description
    #@user = User.find(params[:id])
   end

   def update_description
    #@user = User.find(params[:id])
    respond_to do |format|
      if current_user.update(description: params[:user][:description])
        format.turbo_stream { render turbo_stream: turbo_stream.replace('user-description', partial:'users/user_description', locals: { user: current_user })}
      end
    end
   end

   def edit_account
   end

   def update_account
    respond_to do |format|
      if current_user.update(user_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace('account-details', partial:'users/user_account', locals: { user: current_user })}
      end
    end
   end

   def edit_personal_details
   end

   def update_personal_details
    respond_to do |format|
      if current_user.update(user_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace('personal-details', partial:'users/user_personal_details', locals: { user: current_user })}
      end
    end
   end

   def edit_family_details
   end

   def update_family_details
    respond_to do |format|
      if current_user.update(user_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace('family-details', partial:'users/user_family_details', locals: { user: current_user })}
      end
    end
   end

   def edit_contact_details
   end

   def update_contact_details
    respond_to do |format|
      if current_user.update(user_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace('contact-details', partial:'users/user_contact_details', locals: { user: current_user })}
      end
    end
   end

   def edit_pass
   end

   def update_pass
    if current_user&.valid_password?(params[:user][:current_password])
      respond_to do |format|
        if current_user.update(user_params)
          format.turbo_stream { render turbo_stream: turbo_stream.replace('password', partial:'users/user_password', locals: { user: current_user })}
        end
      end
    else
      #current_user.errors.add(:current_password, "is incorrect")
      flash[:alert] = "Current password is incorrect"

    end
   end

   def edit_profile_image
   end

   def update_profile_image
    
    respond_to do |format|
      if current_user.update(user_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace('profile_image', partial:'users/user_profile_image', locals: { user: current_user })}
      end
    end
   end
  
    # def edit
    #   # @user is already set by the before_action
    # end
  
    # def update
    #   if @user.update(user_params)
    #     redirect_to @user, notice: 'User was successfully updated.'
    #   else
    #     render :edit
    #   end
    # end
  
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
          :email, :created_at, :updated_at, :first_name, :last_name, :contact_number, :address, :username, :password, :password_confirmation,:dob, :father_name, :mother_name, :religion, :cast , :height, :weight, :highest_qualification, :job_packages, :job_location, :mother_tongue, :description, :age,
           :current_password ,:avatar
        
        )
    end

    

  end
  