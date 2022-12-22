source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.1", ">= 6.1.3.1"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"

# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 5.3"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production

gem "redis", "~> 4.0"
gem "hiredis"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

# framework for building view components that are reusable, testable & encapsulated, in Ruby on Rails.
gem "view_component", "~> 2.80", require: "view_component/engine"

gem "tty-command"
# A Ruby client for the official GitHub API.
gem "github_api"
# Flexible authentication solution for Rails with Warden
gem "devise", "~> 4.8", ">= 4.8.0"
# AASM - State machines for Ruby classes (plain Ruby, ActiveRecord)
gem "aasm", "~> 5.2", ">= 5.2.0"
# The Networking and Cryptography (NaCl) library provides a high-level toolkit for building cryptographic systems and protocols
gem "rbnacl", "~> 7.1", ">= 7.1.1"

group :development, :test do
  gem "puma", "~> 5.1"
  gem "awesome_print"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-rails"
  # 🌟 Ruby Style Guide, with linter & automatic code fixer
  gem "standard", group: [:development, :test]
end

group :development do
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
  # A fully configurable and extendable Git hook manager
  gem "overcommit"

  gem 'mutant-minitest', '~> 0.10.31'

  source 'https://oss:cUsw1fO1EK35ZewlWybDC9F9wG9DKzaQ@gem.mutant.dev' do
    gem 'mutant-license'
  end
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "minitest-reporters"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers", require: !ENV["SELENIUM_URL"]
  gem "simplecov", require: false
  # Mocking and stubbing library with JMock/SchMock syntax, which allows mocking and stubbing of methods on real (non-mock) classes.
  gem "mocha", "~> 1.2", ">= 1.2.1"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "stimulus_reflex", "~> 3.4"
