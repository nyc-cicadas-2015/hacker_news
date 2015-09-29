require_relative '../rails_helper'

describe "comment creation process" do
  let(:log_me_in) {
    LoginPageHelper.new.visit_page.login(user)
  }

  before :each do
    create(:user)
    log_me_in
  end

  let(:user) { attributes_for(:user) }
  let(:post) { create(:post) }

  it "allows me to leave a comment if i am logged in" do
    visit post_path(post.id)
    expect(page).to have_selector("input[type=submit][value='Add comment']")
  end
end

