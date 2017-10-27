# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'awesome_print'
gem 'devise'
gem 'devise-foundation-views'
gem 'devise-i18n'
gem 'font-awesome-rails'
gem 'foreman'
gem 'foundation-rails'
gem 'high_voltage', '~> 3.0.0'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'pundit'
gem 'rack-affiliates'
gem 'rails', '~> 5.1.3'
gem 'rails-controller-testing'
gem 'rails-i18n', '~> 5.0.0'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'state_machines-activerecord'
gem 'toastr-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.6'
  gem 'rspec_junit_formatter'
  gem 'rubocop', '~> 0.50.0', require: false
  gem 'rubocop-rspec'
  gem 'shoulda-matchers',
      git: 'https://github.com/thoughtbot/shoulda-matchers.git',
      branch: 'rails-5'
  gem 'slim_lint'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'codecov', require: false
  gem 'simplecov', require: false
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
