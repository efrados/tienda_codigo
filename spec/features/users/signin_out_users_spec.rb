# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signing Out Users' do
  before do
    @john = User.new(email: 'john@example.com', password: 'password', first_name: 'john', last_name: 'doe')
    @john.skip_confirmation_notification!
    @john.save
    @john.confirm
    login_as(@john)
  end

  scenario 'with a logged in user' do
    visit '/'

    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully.')
    expect(page).not_to have_content(@john.email.to_s)
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end
end
