require_relative '../rails_helper'

describe "the signin process" do
  before :each do
    create(:user)
  end

  let(:user) { attributes_for(:user) }

  it "signs me in" do
    visit login_path
    within("#new_user") do
      fill_in 'user_username', :with => user[:username]
      fill_in 'user_password', :with => user[:password]
    end
    click_button 'Login'
    expect(page).to have_content "Hello #{user[:name]}"
  end
end

