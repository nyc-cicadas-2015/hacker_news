class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user
      flash[:valid_session] = "Welcome #{user.username}!!"
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:invalid_login] = "Unable to find password & username combination"
      redirect_to '/users/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
