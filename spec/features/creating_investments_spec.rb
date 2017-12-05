require "rails_helper"

RSpec.feature "Users can create new investments" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user)
    deal = FactoryGirl.create(:deal, street: "3 rue des cocotiers")
    assign_role!(user, :editor, deal)

    visit deal_path(deal)
    click_link "New Investment"
    # click_link "INVESTIR"
  end

  scenario "with valid attributes" do
    # fill_in "Description", with: "buy 2 shares"
    fill_in "Price", with: 1000
    # fill_in('Price', :with => '1000.00')
    # find('#investment_price').set('1000')
    # fill_in investment[price], with: 2
    fill_in "Shares", with: 3
    # fill_in('Shares', :with => '3')
    # find('#investment_shares').set('3')
    # fill_in investment[shares], with: 2
    # find("#id_of_hidden_input", :visible => false).value
    # find('#sample', visible: false).value
    # find("#investment_user_id", :visible => false).value
    # find('#investment_user_id', visible: false).value
    # click_button "Invest (create)"
    click_button "Invest"

    expect(page).to have_content "Investment has been created"
    within("#investment") do
      expect(page).to have_content "Investor: #{user.email}"
    end
  end

  scenario "when providing invalid attributes" do
    # click_button "Invest (create)"
    click_button "Invest"
    expect(page).to have_content "Investment has not been created"
    expect(page).to have_content "Price can't be blank"
    expect(page).to have_content "Shares can't be blank"
  end

  # scenario "with an invalid description" do
  #   fill_in "Description", with: "Random"
  #   fill_in "Price", with: 1000
  #   fill_in "Shares", with: 3
  #   click_button "Invest"

  #   expect(page).to have_content "Investment has not been created"
  #   expect(page).to have_content "Description is too short"
  # end

end
