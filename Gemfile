source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'sqlite3'
gem 'json'
gem 'databasedotcom'
gem 'jquery-rails'
gem 'omniauth', "~> 0.2.4"
#gem 'omniauth-oauth2', :git => 'git://github.com/intridea/omniauth-oauth2.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'rack-ssl-enforcer', :require => 'rack/ssl-enforcer'
  gem 'thin'
  gem 'heroku'
  gem 'rspec-rails'
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
end

group :production do
  gem 'pg'
end


