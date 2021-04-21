require "rails_helper"

RSpec.feature "Creating a Query for a product" do

  before do
    @john = User.create!(email: "john@example.com", password: "password", first_name: "john", last_name: "doe")
    login_as(@john)
    @p1 = Product.create(product_name: "Product name 1",
                        product_description: "product description 1",
                        product_price: 10.50,
                        product_text: "Product Text 1")
  end

  scenario "with a logged in user" do
    visit "/"
    click_link(href: product_path(@p1))
    expect(page).not_to have_content("Thanks for submiting a query!")
    expect(page).not_to have_field('Email')
    expect(page).not_to have_field('Name')
    fill_in "Text", with: "Query text"
    click_button "Submit Query"

    expect(page).to have_content("Thanks for submiting a query!")
    expect(current_path).to eq(product_path(@p1))

  end

  pending "with an unregistered in user" do
    before do
      logut
      visit "/"
      click_link(href: product_path(@p1))
      fill_in "Email", with: "example@example.com"
      fill_in "Name", with: "Peter"
    end

    scenario "and valid query" do
      fill_in "Text", with: "Query text"
      click_button "Submit query"

      expect(page).to have_content("Thanks for submiting a query!")
      expect(current_path).to eq(product_path(@p1))
    end


    scenario "and invalid query" do
      fill_in "Text", with: ""
      click_button "Submit query"

      expect(page).to have_content("Please fill in the forms")
      expect(current_path).to eq(product_path(@p1))
    end
  end
end