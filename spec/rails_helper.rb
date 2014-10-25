ENV['RAILS_ENV'] ||= 'test'

require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

FIXTURES = YAML.load_file(File.expand_path('../fixtures/base.yml', __FILE__))
FIXTURES.symbolize_keys!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include SpecSupport::RequestHelpers, type: :request
  config.include FactoryGirl::Syntax::Methods

  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)

    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
