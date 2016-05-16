require "spec_helper"

feature "user can review business" do
  scenario "while logged_in? and valid inputs" do
    category = Fabricate(:category)
    business = Fabricate(:business, category_id: category.id)
    alice  = Fabricate(:user)
    ui_sign_in(alice)
    expect(page).to have_content alice.email

    visit business_path(business)

    expect(page).to have_content business.name
    expect(page).to have_content "Add review"

    fill_in "review_title", with: "A great title"
    select "1", from: "review_rating"
    fill_in "review_body", with: "This is a long enough string to be a body"
    click_button "Add review"

    expect(page).to have_content "A great title"
    expect(page).to have_content "#{business.name} | Rating: 1" 


    visit user_path(alice)
    expect(page).to have_content alice.username
    expect(page).to have_content "A great title"


  end


end