source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "~> 7.0.8.4"
gem "blankslate" 
gem "sprockets-rails"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 4.0.0'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'gimei'
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
end

group :development do
  gem "web-console"
  gem 'rubocop', require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :production do
  gem 'pg'
  gem 'unicorn', '6.1.0'
end

gem 'pry-rails'
gem 'devise'
gem 'mini_magick'
gem 'image_processing', '~> 1.2'
gem 'active_hash'
gem 'payjp'
gem 'gon'