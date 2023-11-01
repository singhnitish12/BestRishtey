Rails.application.routes.draw do
  
  root to: 'home#index' 
   


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
   
     #Specify a custom sign-out path
    devise_scope :user do
      get '/users/sign_out' => 'users/sessions#destroy'
    end

     
   # Define Active Admin routes
   ActiveAdmin.routes(self)  

   

   
  
  resources :users, only: [:show, :edit, :update, :destroy]
  get '/confirmation_pending' => 'home#after_registration_path'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'edit_description', to: "users#edit_description", as: 'edit_user_description'
  patch 'update_description', to: "users#update_description", as: 'update_user_description'

  get 'edit_account', to: "users#edit_account", as: 'edit_user_account'
  patch 'update_account', to: "users#update_account", as: 'update_user_account'

  get 'edit_personal_details', to: "users#edit_personal_details", as: 'edit_user_personal_details'
  patch 'update_personal_details', to: "users#update_personal_details", as: 'update_user_personal_details'

  get 'edit_family_details', to: "users#edit_family_details", as: 'edit_user_family_details'
  patch 'update_family_details', to: "users#update_family_details", as: 'update_user_family_details'

  get 'edit_contact_details', to: "users#edit_contact_details", as: 'edit_user_contact_details'
  patch 'update_contact_details', to: "users#update_contact_details", as: 'update_user_contact_details'

  get 'edit_pass', to: "users#edit_pass", as: 'edit_user_pass'
  patch 'update_pass', to: "users#update_pass", as: 'update_user_pass'

  get 'edit_profile_image', to: "users#edit_profile_image", as: 'edit_user_profile_image'
  patch 'update_profile_image', to: "users#update_profile_image", as: 'update_user_profile_image'

  # Defines the root path route ("/")
  # root "articles#index"
end
