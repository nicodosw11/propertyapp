require "rails_helper"
RSpec.feature "Users can create new deals" do
  before do
    visit "/"

    click_link "New Deal"
  end

  scenario "with valid attributes" do
    fill_in "City", with: "Chatou"
    fill_in "District", with: "Yvelines"
    fill_in "Street", with: "3 rue des peupliers"
    fill_in "Postcode", with: "78400"
    fill_in "Type", with: "Appartement"
    fill_in "Occupancy", with: "Viager occupé"
    fill_in "Surface", with: "105"
    fill_in "deal_nb_bedrooms", with: "2"
    fill_in "deal[nb_bathrooms]", with: "1"
    fill_in "Description (amenities)", with: "Lorem ipsum1"
    fill_in "Description (location)", with: "Lorem ipsum2"

    click_button "Create Deal"

    expect(page).to have_content "Deal was successfully created"

    deal = Deal.find_by(street: "3 rue des peupliers")
    # expect(page.current_url).to eq deal_url(deal)
    expect(page.current_url).to eq deals_url

    # title = "Chatou - Deals - Livsty"
    # expect(page).to have_title title
  end
  scenario "when providing invalid attributes" do
    click_button "Create Deal"

    expect(page).to have_content "Deal has not been created."
    expect(page).to have_content "Street can't be blank"
  end
end


