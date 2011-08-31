source 'http://rubygems.org'

gem 'rails', '3.0.3'

gem 'mysql2'
gem 'tenacity'
gem "haml-rails", ">= 0.2"
gem "devise", ">= 1.2.rc"
gem "compass", ">= 0.10.6"
gem 'chronic'

group :development do
  gem 'hpricot' #generating devise views
  gem 'ruby_parser' #generating devise views
  gem 'hirb' # mysql-like format for AR queries in console
end

group :development, :test do
  gem 'mongrel', '1.2.0.pre2'
  gem "rspec-rails", ">= 2.4.0"
  gem 'steak', '>= 1.0.1'
  gem "capybara", "~> 0.3.8"
  gem 'machinist', '>= 2.0.0.beta2'
  gem "faker"
  gem "accept_values_for"
  gem 'timecop'
end

group :test do
  gem 'autotest'
  gem 'webrat'
  gem 'launchy'
  gem 'faraday'
  gem "spork", ">= 0.8.4"
end

group :cucumber do
  gem "cucumber", ">= 0.10.0"
  gem "cucumber-rails", ">= 0.4.0.beta.1"
  gem "capybara", "~> 0.3.8"
  gem "database_cleaner", ">=0.5.0"
  gem "spork", ">= 0.8.4"
  gem "pickle"
  gem 'akephalos', :git => 'git://github.com/thoughtbot/akephalos.git'
  gem "treetop"
  gem "launchy"
end