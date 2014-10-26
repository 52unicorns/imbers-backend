ENV['RAILS_ENV'] ||= 'test'

require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'sidekiq/testing'

Sidekiq::Testing.fake!

FIXTURES = YAML.load_file(File.expand_path('../fixtures/base.yml', __FILE__))
FIXTURES.symbolize_keys!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

VCR.configure do |c|
  c.configure_rspec_metadata!
  c.ignore_hosts ENV['NEO4J_TEST_HOST']
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.ignore_localhost = true
  c.default_cassette_options = {
    serialize_with: :json,
    decode_compressed_response: :json,
    preserve_exact_body_bytes: true
  }
end

RSpec.configure do |config|
  config.include SpecSupport::RequestHelpers, type: :request
  config.include SpecSupport::AuthHelpers, type: :request
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

  config.before(:each) do
    neo = Neography::Rest.new
    neo.execute_query('MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r')
  end
end
