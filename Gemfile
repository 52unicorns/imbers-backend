source 'https://rubygems.org'

# Core
gem 'rails', '4.1.6'
gem 'pg'
gem 'dotenv-rails'
gem 'schema_plus'
gem 'pry-rails'

# API
gem 'responders'
gem 'active_model_serializers'
gem 'jbuilder'

# Background jobs
gem 'clockwork'
gem 'sidekiq'
gem 'slim', '>= 1.1.0'
gem 'sinatra', '>= 1.3.0', require: false

gem 'koala'
gem 'uglifier'

group :development, :test do
  gem 'foreman'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'awesome_print'
  gem 'rubocop', require: false
end

group :test do
  gem 'vcr'
  gem 'factory_girl_rails'
  gem 'webmock'
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
  gem 'puma'
end
