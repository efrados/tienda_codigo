# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Listing HomePage' do
  scenario 'with user not singed in' do
    visit '/'

    expect(page).to have_content('Welcome!')
    expect(page).to have_link('Home')
  end
end
