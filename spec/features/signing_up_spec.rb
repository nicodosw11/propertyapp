require "rails_helper"

RSpec.feature "Users can sign up" do
  scenario "when providing valid details" do
    visit "/"
    # click_link "Sign up"
    # click_link "Inscription"
    first(:link, "Inscription").click
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    select("France", :from => "user_country_of_residence").select_option
    fill_in "Email", with: "signuptest@example.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    # expect(page).to have_content("You have signed up successfully.")
    expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
  end
end
