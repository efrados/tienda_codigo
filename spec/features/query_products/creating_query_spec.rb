require "rails_helper"

RSpec.feature "Creating a Query for a product" do

  before do
    @john = User.new(email: "john@example.com", password: "password", first_name: "john", last_name: "doe")
    @john.skip_confirmation_notification!
    @john.save
    login_as(@john)
    @john.confirm
    @p1 = Product.create(product_name: "Product name 1",
                        product_description: "product description 1",
                        product_price: 10.50,
                        product_text: "Product Text 1")
  end

  scenario "with a logged in user" do
    visit "/"
    click_link(href: product_path(@p1))
    expect(page).not_to have_content("Thanks for submiting a query")
    expect(page).not_to have_field('Email')
    expect(page).not_to have_field('Name')
    fill_in "query_product_query_text", with: "Query text"
    click_button "Submit Query"

    expect(page).to have_content("Thanks for submiting a query")
  end

  context "with an unregistered in user" do
    before do
      logout
      visit "/"
      click_link(href: product_path(@p1))
    end

    scenario "and valid query" do
      fill_in "Email", with: "example@example.com"
      fill_in "Name", with: "Peter"
      fill_in "query_product_query_text", with: "Query text"
      click_button "Submit Query"

      expect(page).to have_content("Thanks for submiting a query")
    end


    scenario "and invalid query" do
      fill_in "query_product_query_text", with: ""
      click_button "Submit Query"

      expect(page).to have_content("did not allow to save this query product")
    end
  end
end