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

  describe "POST #create" do
    describe "When Successful" do
      let(:user_params) { { user: attributes_for(:user) } }

      it "Creates a user" do
        post(:create, user_params)
        expect(response).to redirect_to(root_path)
      end

      it "Increased number of users in the database by 1" do
        expect{post(:create, user_params)}.to change{User.count}.by(1)
      end
    end

    describe "When Unsuccessful" do
      it "redirects to login" do
        post(:create, user: {name: 'nil', username: 'nil', password: 'nil' })
      end

      # Test redirect
      # Test flash error
    end
  end
end




# FACTORY GIRL METHODS PSUEDOCODED
  # def create type
  #   build(type).save
  # end

  # def build type
  #   type.classify.new(attributes_for(type))
  # end

  # def attributes_for type
  #   attrs = type.classify.attributes # :user -> User
  #   attrs.each_with_object({}) { |obj, attr| obj[attr] = Faker::Name.blah }
  # end

