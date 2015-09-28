class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_filter :require_login

  # private

  # def require_login
  #   unless logged_in?
  #     flash[:error] = "you must be logged in"
  #     redirect_to "/login"
  #   end
  # end
end
