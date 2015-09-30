require 'rails_helper'

describe UsersController do
  describe "Get new" do
    it "Creates a new user" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end
end
