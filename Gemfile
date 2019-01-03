source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
gem 'rails', '~> 5.2.1'

gem 'pg'
gem 'puma', '~> 3.11'

gem 'sass-rails', '~> 5.0'
gem 'haml', '~> 5.0', '>= 5.0.4'
gem "haml-rails", "~> 1.0"
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'rails-i18n'

gem 'friendly_id', '~> 5.2', '>= 5.2.4'
gem 'client_side_validations', '~> 11.1', '>= 11.1.3'
gem 'geocoder', '~> 1.5'
gem 'sorcery', '~> 0.13.0'
gem 'rails_admin', '~> 1.4', '>= 1.4.2'
gem 'trix-rails', '~> 2.0', require: 'trix'
gem 'stripe'
gem 'sucker_punch', '~> 2.0'
gem 'mini_magick', '~> 4.8'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
