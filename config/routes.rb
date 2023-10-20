Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  root 'home#index'
  resources :users, only: [:show, :edit, :update, :destroy]
  get '/confirmation_pending' => 'home#after_registration_path'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'edit_description/:id', to: "users#edit_description", as: 'edit_user_description'
  # Defines the root path route ("/")
  # root "articles#index"
end
