require "rails_helper"

RSpec.feature "Users can view investments" do
  before do
    user = FactoryGirl.create(:user)

    cocotiers = FactoryGirl.create(:deal, street: "3 rue des cocotiers")
    FactoryGirl.create(:investment, deal: cocotiers,
      user: user,
      price: 1000.0, shares: 4,
      description: "buy 4 shares"
      )

    amandiers = FactoryGirl.create(:deal, street: "5 rue des amandiers")
    FactoryGirl.create(:investment, deal: amandiers,
      user: user,
      price: 1000.0, shares: 2,
      description: "buy 2 shares")

    login_as(user)
    visit "/deals"
  end

  scenario "for a given deal" do
    # click_link "3 rue des cocotiers"
    # find(".thumbnail.overview-asset").click
    all(".thumbnail.overview-asset").last.click

    # expect(page).to have_content "buy 4 shares"
    # expect(page).to_not have_content "buy 2 shares"

    expect(page).to have_content "2 shares for 1000.0 each"
    expect(page).to_not have_content "4 shares for 1000.0 each"

    # click_link "buy 4 shares"
    click_link "2 shares for 1000.0 each"
    within("#investment ul:first-of-type") do
      # expect(page).to have_content "buy 4 shares"
      expect(page).to have_content "Shares: 2"
    end

    # expect(page).to have_content "just a random transaction"
  end
end
