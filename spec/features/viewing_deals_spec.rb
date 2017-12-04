require "rails_helper"
# require "support/authorization_helpers"

RSpec.feature "Users can view deals" do
  let(:user) { FactoryGirl.create(:user) }
  let(:deal) { FactoryGirl.create(:deal, street: "3 rue des cocotiers") }
  before do
    login_as(user)
    assign_role!(user, :viewer, deal)
  end
  scenario "with the deal details" do
    # deal = FactoryGirl.create(:deal, street: "3 rue des cocotiers")
    # user = FactoryGirl.create(:user, first_name:  "Admin",
    #          last_name:  "User",
    #          email: "admin@propertyapp.org",
    #          password:              "foobar",
    #          password_confirmation: "foobar",
    #          admin:     true,
    #          confirmed_at: Time.zone.now)
    visit "/deals"
    # click_link "3 rue des peupliers"
    find(".thumbnail.overview-asset").click
    expect(page.current_url).to eq deal_url(deal)
  end
  scenario "unless they do not have permission" do
    FactoryGirl.create(:deal, street: "Hidden")
    visit "/deals"
    expect(page).not_to have_content "Hidden"
  end
end
