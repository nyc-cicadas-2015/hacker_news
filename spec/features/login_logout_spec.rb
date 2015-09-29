require_relative '../rails_helper'

describe "the signin process" do
  let(:log_me_in) {
    LoginPageHelper.new.visit_page.login(user)
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

