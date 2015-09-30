require 'rails_helper'

describe UsersController do
  describe "GET #new" do
    it "Creates a new user" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end

  describe "GET #show" do
    before(:each) {
      @user = create(:user)
    }
    let(:user) { attributes_for(:user)}
    it "Shows a specific user page" do
      get :show, id: @user.id
      expect(assigns(:user).id).to be(@user.id)
    end
  end
end
