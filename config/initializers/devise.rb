# frozen_string_literal: true

class TurboFailureApp < Devise::FailureApp
  def respond
    if request_format == :turbo_stream
      redirect
    else
      super
    end
  end

  def skip_format?
    %w[html turbo_stream */*].include? request_format.to_s
  end
end

Devise.setup do |config|
  # ==> Controller configuration
  # Configure the parent class to the devise controllers.
  config.parent_controller = 'TurboController'

  # ==> Warden configuration
  config.warden do |manager|
    manager.failure_app = TurboFailureApp
  end

  config.mailer_sender = 'earreche@codigodelsur.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 12

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  case Rails.env
  when 'development', 'test'
    config.omniauth :facebook,
                    Rails.application.credentials[:facebook][:app_id],
                    Rails.application.credentials[:facebook][:app_secret],
                    token_params: { parse: :json }
    config.omniauth :google_oauth2,
                    Rails.application.credentials[:google][:app_id],
                    Rails.application.credentials[:google][:app_secret],
                    scope: 'userinfo.email,userinfo.profile'

  when 'production'
    config.omniauth :facebook,
                    ENV['FACEBOOK_API_ID'],
                    ENV['FACEBOOK_API_SECRET'],
                    token_params: { parse: :json }
    config.omniauth :google_oauth2,
                    ENV['GOOGLE_OAUTH_CLIENT_ID'],
                    ENV['GOOGLE_OAUTH_CLIENT_SECRET']
  end
end
