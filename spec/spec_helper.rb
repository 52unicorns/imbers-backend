require 'vcr'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  VCR.configure do |c|
    c.configure_rspec_metadata!
    c.cassette_library_dir = 'spec/cassettes'
    c.hook_into :webmock
    c.ignore_localhost = true
    c.default_cassette_options = {
      serialize_with: :json,
      decode_compressed_response: :json,
      preserve_exact_body_bytes: true
    }
  end
end
