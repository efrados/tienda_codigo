# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Showing product' do
  before do
    @john = User.new(email: 'john@example.com', password: 'password', first_name: 'john', last_name: 'doe')
    @john.skip_confirmation_notification!
    @john.save
    @john.confirm
    login_as(@john)
    @p1 = Product.create(product_name: 'Product name 1',
                         product_description: 'product description 1',
                         product_price: 10.50,
                         product_text: 'Product Text 1')
    @p2 = Product.create(product_name: 'Product name 2',
                         product_description: 'Product description 2',
                         product_price: 100.50,
                         product_text: 'Product Text 2')
  end

  scenario 'with a logged in user' do
    visit '/'
    click_link(href: product_path(@p1))

    expect(page).to have_content(@p1.product_name.capitalize)
    expect(page).to have_content(@p1.product_price)
    expect(page).to have_content(@p1.product_text.capitalize)
    expect(page).to have_content(@p1.product_description.capitalize)
    expect(page).not_to have_link(nil, href: product_path(@p1))

    expect(page).not_to have_content(@p2.product_name)
    expect(page).not_to have_content(@p2.product_price)
    expect(page).not_to have_link(nil, href: product_path(@p2))
    expect(page).not_to have_content(@p2.product_text)
  end
end
