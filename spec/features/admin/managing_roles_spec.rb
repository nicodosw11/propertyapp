require "rails_helper"

RSpec.feature "Admins can manage a user's roles" do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:user) { FactoryGirl.create(:user) }

  let!(:cocotiers) { FactoryGirl.create(:deal, street: "3 rue des cocotiers") }
  let!(:amandiers) { FactoryGirl.create(:deal, street: "5 rue des amandiers") }

  before do
    login_as(admin)
  end

  scenario "when assigning roles to an existing user" do
    visit admin_user_path(user)
    click_link "Edit User"

    select "Viewer", from: "3 rue des cocotiers"
    select "Manager", from: "5 rue des amandiers"

    click_button "Update User"
    expect(page).to have_content "User has been updated"

    click_link user.email
    expect(page).to have_content "3 rue des cocotiers: Viewer"
    expect(page).to have_content "5 rue des amandiers: Manager"
  end

  scenario "when assigning roles to a new user" do
    visit new_admin_user_path

    fill_in "Email", with: "newuser@propertyapp.com"
    fill_in "Password", with: "password"

    select "Editor", from: "3 rue des cocotiers"
    click_button "Create User"

    click_link "newuser@propertyapp.com"
    expect(page).to have_content "3 rue des cocotiers: Editor"
    expect(page).not_to have_content "5 rue des amandiers"
  end
end
