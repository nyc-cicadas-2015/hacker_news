require_relative '../rails_helper'

describe "the signin process" do
  let(:log_me_in) {
    visit login_path
    within("#new_user") do
      fill_in 'user_username', :with => user[:username]
      fill_in 'user_password', :with => user[:password]
    end
    click_button 'Login'
  }

  before :each do
    create(:user)
    log_me_in
  end

  let(:user) { attributes_for(:user) }

  it "signs me in" do
    expect(page).to have_content "Hello #{user[:name]}"
  end

  it 'signs me out' do
    click_link 'Logout'
    expect(page).to have_content "login | register"
  end
end

