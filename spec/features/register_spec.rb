require_relative '../rails_helper'

describe "the register process" do
  before :each do
    create(:new_user)
  end

  let(:new_user) { attributes_for(:new_user) }

  it "it registers me" do
    visit new_user_path
    within("#new_user") do
      fill_in 'user_name', :with => new_user[:name]
      fill_in 'user_username', :with => new_user[:username]
      fill_in 'user_password', :with => new_user[:password]
    end
    click_button 'Register'
    expect(page).to have_content "Hello #{new_user[:name]}"
  end
end

