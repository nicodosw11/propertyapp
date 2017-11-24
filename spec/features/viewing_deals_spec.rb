require "rails_helper"

RSpec.feature "Users can view deals" do
  scenario "with the deal details" do
    deal = FactoryGirl.create(:deal, street: "3 rue des cocotiers")
    visit "/deals"
    # click_link "3 rue des peupliers"
    find(".thumbnail.overview-asset").click
    expect(page.current_url).to eq deal_url(deal)
  end
end
