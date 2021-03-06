source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 0.18.4'

# Include Bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Annotate models to know architecture
gem 'annotate'
# Allow to simply give data to js files
gem 'gon'

# HAML
gem "haml-rails", "~> 0.9"
# Simple Form
gem 'simple_form'

#New Relic
gem 'newrelic_rpm'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # To easily create objects
  gem 'factory_girl_rails'

  # Fake data for factories
  gem 'faker'

  # Allow to launch browser for capybara
  gem 'launchy'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console',                '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'guard-rspec',                require: false      # Integration rspec with guard
end

group :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'poltergeist'                 # PhantomJS web driver for tests
  gem 'database_cleaner'            # Erase database between each test
  gem 'shoulda-matchers'            # Add rspec matchers for models
  gem 'shoulda-callback-matchers'   # More matchers for rspec!
  gem 'fuubar'                      # Display a nice process bar in console during tests
  gem 'webmock'                     # Library for stubbing and setting expectations on HTTP requests
  gem 'cucumber-rails',             require: false
  gem 'simplecov',                  require: false  # Coverage lib
end