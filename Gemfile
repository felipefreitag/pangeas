source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'jquery-rails'
gem 'slim-rails'
gem 'sass-rails', '~> 5.0'
gem 'foundation-rails'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'turbolinks', '~> 5'
gem 'foreman'
gem 'devise'
gem 'pundit'
gem 'rails-i18n', '~> 5.0.0'
gem 'devise-i18n'
gem 'devise-i18n-views', github: 'mcasimir/devise-i18n-views'
gem 'devise-foundation-views'
gem 'toastr-rails'
gem 'state_machines-activerecord'
gem 'font-awesome-rails'

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.6'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'webmock'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
