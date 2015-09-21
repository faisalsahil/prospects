source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.15'
gem 'pg'
gem "thin"
gem "haml"
gem 'will_paginate', '~> 3.0'
gem 'bootstrap-will_paginate'
gem 'devise'
gem 'draper'
gem 'rest_in_place'
gem "haml-rails"
gem 'acts-as-taggable-on'
gem 'paper_trail'
gem 'carrierwave'
gem 'fog'
gem 'cancan'
gem 'sentry-raven'

gem 'activeadmin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "twitter-bootstrap-rails"
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'quiet_assets'
  gem 'better_errors'
  gem "binding_of_caller"
end

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end

group :production do
  gem 'newrelic_rpm'
end
