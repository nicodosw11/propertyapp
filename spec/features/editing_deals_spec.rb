require "rails_helper"

RSpec.feature "Users can edit existing deals" do

  before do
    FactoryGirl.create(:deal, street: "3 rue des peupliers")

    visit "/deals"
    # click_link "3 rue des peupliers"
    click_link "Edit Deal"
  end
  scenario "with valid attributes" do
    fill_in "City", with: "Chatou"
    click_button "Update Deal"

    expect(page).to have_content "Deal was successfully updated"
    expect(page).to have_content "Chatou"
  end
  scenario "when providing invalid attributes" do
    fill_in "Street", with: ""
    click_button "Update Deal"

    expect(page).to have_content "Deal has not been updated"
  end
end
