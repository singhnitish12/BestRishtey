# app/models/ability.rb
class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # Guest user
  
      if user.admin?
        can :manage, :all
      else
        # Define permissions for regular users here
        can :read, :dashboard
      end
    end
  end
  