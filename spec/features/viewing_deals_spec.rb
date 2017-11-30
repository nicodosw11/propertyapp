require "rails_helper"

RSpec.feature "Users can view deals" do
  scenario "with the deal details" do
    deal = FactoryGirl.create(:deal, street: "3 rue des cocotiers")
    ## TODO login ##
    user = FactoryGirl.create(:user, first_name:  "Admin",
             last_name:  "User",
             email: "admin@propertyapp.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             confirmed_at: Time.zone.now)
    login_as(user)
    ##
    visit "/deals"
    # click_link "3 rue des peupliers"
    find(".thumbnail.overview-asset").click
    expect(page.current_url).to eq deal_url(deal)
  end
end
