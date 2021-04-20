require "rails_helper"

RSpec.feature "Signing up Users" do

  scenario "with valid credentials" do
    visit "/"

    click_link "Sign up"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "john@example.com"
    fill_in "Password",  with: "password"
    fill_in "Password confirmation",  with: "password"

    click_button "Sign up"
   
    expect(page).to have_content("You have signed up successfully.")
    expect(page).to have_content("john@example.com")
  end

  scenario "with invalid credentials" do
    visit "/"

    click_link "Sign up"
    fill_in "First name", with: ""
    fill_in "Last name", with: ""
    fill_in "Email", with: "john@example.com"
    fill_in "Password",  with: "password"
    fill_in "Password confirmation",  with: "password"

    click_button "Sign up"
   
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
  end
end