# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.0'

gem 'cancancan'
gem 'devise', github: 'heartcombo/devise', branch: 'ca-omniauth-2'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'

gem 'rubocop', require: false
gem 'rubocop-rails', require: false
gem 'rubocop-rspec', require: false

gem 'active_storage_validations'
gem 'image_processing'
gem 'mini_magick'

gem 'administrate'
gem 'administrate-field-active_storage'
gem 'bourbon'
gem 'pagy'

gem 'sass-rails', '>= 6'

gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'guard'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'sqlite3', '~> 1.4'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :production do
  gem 'pg', '~> 1.1'
end

gem 'hotwire-rails', '~> 0.1.3'
