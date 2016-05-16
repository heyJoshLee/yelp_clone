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

    review_params = Fabricate(:review)

    fill_in "review_title", with: review_params.title
    select review_params.rating, from: "review_rating"
    fill_in "review_body", with: review_params.body
    click_button "Add review"

    expect(page).to have_content review_params.title
    expect(page).to have_content "#{business.name} | Rating: #{review_params.rating}" 


    visit user_path(alice)
    expect(page).to have_content alice.username
    expect(page).to have_content review_params.title


  end


end