# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Confirming Users' do
  before do
    @john = User.create(email: 'john@example.com', password: 'password', first_name: 'john', last_name: 'doe')
  end
  scenario 'with valid link' do
    mail = ActionMailer::Base.deliveries.first
    url = mail.body.decoded[%r{http://localhost:3000/users/confirmation\?confirmation_token=([^"]+)}]
    visit url
    expect(page).to have_content('Your email address has been successfully confirmed')
  end

  scenario 'with invalid link' do
    visit 'http://localhost:3000/users/confirmation?confirmation_token=randomtoken'
    expect(page).to have_content('Confirmation token is invalid')
  end

  scenario 'with no link' do
    visit '/'
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end
end
