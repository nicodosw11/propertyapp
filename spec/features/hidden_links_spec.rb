require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:deal) { FactoryGirl.create(:deal) }
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:investment) do
    FactoryGirl.create(:investment, deal: deal, user: user)
  end

  context "anonymous users" do
    scenario "cannot see the New Deal link" do
      visit "/deals"
      expect(page).not_to have_link "New Deal"
    end
  end

  context "non-admin users (deal viewers)" do
    before do
      login_as(user)
      assign_role!(user, :viewer, deal)
    end

    scenario "cannot see the New Deal link" do
      visit "/deals"
      expect(page).not_to have_link "New Deal"
    end

    scenario "cannot see the Delete Deal link" do
      visit deal_path(deal)
      expect(page).not_to have_link "Delete Deal"
    end

    scenario "cannot see the Edit Deal link" do
      visit deal_path(deal)
      expect(page).not_to have_link "Edit Deal"
    end

    scenario "cannot see the New Investment link" do
      visit deal_path(deal)
      expect(page).not_to have_link "New Investment"
    end

    scenario "cannot see the Edit Investment link" do
      visit deal_investment_path(deal, investment)
      expect(page).not_to have_link "Edit Invesment"
    end

    scenario "cannot see the Delete Investment link" do
      visit deal_investment_path(deal, investment)
      expect(page).not_to have_link "Delete Investment"
    end

  end

  context "admin users" do
    before { login_as(admin) }

    scenario "can see the New Deal link" do
      visit "/deals"
      expect(page).to have_link "New Deal"
    end

    scenario "can see the Delete Deal link" do
      visit deal_path(deal)
      expect(page).to have_link "Delete Deal"
    end

    scenario "can see the Edit Deal link" do
      visit deal_path(deal)
      expect(page).to have_link "Edit Deal"
    end

    scenario "can see the New Investment link" do
      visit deal_path(deal)
      expect(page).to have_link "New Investment"
    end

    scenario "can see the Edit Investment link" do
      visit deal_investment_path(deal, investment)
      expect(page).to have_link "Edit Investment"
    end

    scenario "can see the Delete Investment link" do
      visit deal_investment_path(deal, investment)
      expect(page).to have_link "Delete Investment"
    end

  end
end
