# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'earreche@codigodelsur.com'
  layout 'mailer'
end
