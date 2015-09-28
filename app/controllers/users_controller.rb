class UsersController < ApplicationController
  # skip_before_filter :require_login, :only => [:new, :create]

  def index
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
end
