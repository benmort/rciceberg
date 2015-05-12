source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.0.0'
gem 'json', '~> 1.7.7'

group :development do
  gem 'pry-rails'
end

group :production do
  # postgresql
  # gem 'pg'
  gem 'thin'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'shoulda'
  gem 'sqlite3'
end

# jQuery
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Paypal Express Payments
gem 'paypal-express'

# Kickstarter's awesome Amazon Flexible Payments gem
gem 'amazon_flex_pay'

# Configuration File
gem 'rails_config'

# For Heroku
gem 'rails_12factor'

gem 'protected_attributes'

#awesomeness
gem 'kaminari'

# image processing
gem "paperclip", "~> 4.2"

# admin tenant creation
gem 'devise'

# slim templates
gem 'slim'

# prd server
gem 'unicorn'

# deployment
gem 'mina'
gem 'mina-sidekiq', :require => false
gem 'mina-unicorn', :require => false
