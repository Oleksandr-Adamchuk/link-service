source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'haml-rails', '~> 1.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari-mongoid'
gem 'mongoid', '~> 6.1.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.5'
gem 'rails_admin', '~> 1.3'
gem 'rails_best_practices'
gem 'reek', '~> 4.7', '>= 4.7.3'
gem 'rubocop', '~> 0.51.0', require: false
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Use SCSS for stylesheets
gem 'bootstrap', '~> 4.0.0.beta2.1'

group :development, :test do
  gem 'byebug'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.7'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', '~> 1.2017', '>= 1.2017.3'
