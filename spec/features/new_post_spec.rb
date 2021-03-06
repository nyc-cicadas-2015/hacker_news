require_relative '../rails_helper'

describe "the post creation process" do
  let(:log_me_in) {
    LoginPageHelper.new.visit_page.login(user)
  }

  before :each do
    create(:user)
    log_me_in
  end

  let(:user) { attributes_for(:user) }

  it "allows me to create a new post, if i am logged in" do
    expect(page).to have_content "Create Post"
  end

  let(:post) { attributes_for(:post) }

  it "making a valid post" do
    visit new_post_path
    within("#new_post") do
      fill_in 'post_url', :with => post[:url]
      fill_in 'post_title', :with => post[:title]
    end
    click_button "Create"
    expect(page).to have_content "#{post[:title]}"
  end
end

