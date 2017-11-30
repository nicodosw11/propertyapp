require "rails_helper"

RSpec.feature "Users can edit existing deals" do
  ## TODO refactor login ##
  let(:user) { FactoryGirl.create(:user) }
  ##

  before do
    ## TODO refactor login ##
    login_as(user)
    ##
    FactoryGirl.create(:deal, street: "3 rue des cocotiers")

    visit "/deals"
    # click_link "3 rue des peupliers"
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
