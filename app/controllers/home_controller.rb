class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :after_registration_path]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def after_registration_path
  end
end