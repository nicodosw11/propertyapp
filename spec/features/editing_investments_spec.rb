require "rails_helper"

RSpec.feature "Users can edit existing investments" do
  let(:user)  { FactoryGirl.create(:user) }
  let(:deal) { FactoryGirl.create(:deal) }
  let(:investment) do
    FactoryGirl.create(:investment, deal: deal, user: user)
  end

  before do
    ## TODO refactor login ##
    login_as(user)
    ##
    visit deal_investment_path(deal, investment)
    click_link "Edit Investment"
  end

  scenario "with valid attributes" do
    # fill_in "Description", with: "just a random transaction"
    fill_in "Shares", with: 5
    ## TODO formaction ##
    # click_button "Update Investment"
    click_button "Invest"
    ##
    expect(page).to have_content "Investment has been updated"

    within("#investment .page-header:nth-child(2) ul:nth-child(2)") do
      # expect(page).to have_content "just a random transaction"
      expect(page).to have_content "Shares: 5"
      # expect(page).not_to have_content investment.description
    end
  end

  scenario "with invalid attributes" do
    # fill_in "Description", with: ""
    fill_in "Shares", with: ""
     # click_button "Update Investment"
    click_button "Invest"
    ##

    expect(page).to have_content "Investment has not been updated"
  end
end


