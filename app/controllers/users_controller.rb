class UsersController < ApplicationController

  # skip_before_filter :require_login, :only => [:new, :create]

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(user_params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:dup_user] = "You already exist, please login"
      redirect_to '/login'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

end
