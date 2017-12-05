require "rails_helper"

RSpec.feature "Users can delete investments" do
  let(:user)  { FactoryGirl.create(:user) }
  let(:deal) { FactoryGirl.create(:deal) }
  let(:investment) do
    FactoryGirl.create(:investment, deal: deal, user: user)
  end

  before do
    login_as(user)
    assign_role!(user, :manager, deal)
    visit deal_investment_path(deal, investment)
  end

  scenario "successfully" do
    click_link "Delete Investment"

    expect(page).to have_content "Investment has been deleted"
    expect(page.current_url).to eq deal_url(deal)
  end
end
