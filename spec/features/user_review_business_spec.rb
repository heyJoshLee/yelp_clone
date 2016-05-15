require "spec_helper"

feature "user can review business" do
  scenario "while logged_in? and valid inputs" do
    category = Fabricate(:category)
    business = Fabricate(:business, category: category)
    user = Fabricate(:user)
    session[:user_id] = user.id
    visit business_path(business)
    binding.pry
  end


end