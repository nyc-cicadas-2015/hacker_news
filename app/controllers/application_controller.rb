class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
      return User.find_by(id: session[:user_id])
    else
      return nil
    end
  end

def logged_in?
  session[:user_id]
end

  # before_filter :require_login

  # private

  # def require_login
  #   unless logged_in?
  #     flash[:error] = "you must be logged in"
  #     redirect_to "/login"
  #   end
  # end
end
