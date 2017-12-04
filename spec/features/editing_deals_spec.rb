require "rails_helper"

RSpec.feature "Deal managers can edit existing deals" do
  let(:user) { FactoryGirl.create(:user) }
  let(:deal) { FactoryGirl.create(:deal, street: "3 rue des cocotiers") }

  before do
    login_as(user)
    assign_role!(user, :manager, deal)

    visit "/deals"
    # click_link "3 rue des peupliers"
    all(".thumbnail.overview-asset").last.click
    click_link "Edit Deal"
  end
  scenario "with valid attributes" do
    fill_in "City", with: "Timbuktu"
    click_button "Update Deal"

    expect(page).to have_content "Deal was successfully updated"
    expect(page).to have_content "Timbuktu"
  end
  scenario "when providing invalid attributes" do
    fill_in "Street", with: ""
    click_button "Update Deal"

    expect(page).to have_content "Deal has not been updated"
  end
end
