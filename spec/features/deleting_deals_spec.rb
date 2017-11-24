require "rails_helper"

RSpec.feature "Users can delete deals" do

  scenario "successfully" do
    FactoryGirl.create(:deal, street: "3 rue des cocotiers")

    visit "/deals"
    click_link "Delete Deal"
    expect(page).to have_content "Deal was successfully deleted"
    expect(page.current_url).to eq deals_url
    expect(page).to have_no_content "Timbuktu"

  end
end
