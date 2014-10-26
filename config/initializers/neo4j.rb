test = Rails.env.test?
host = test ? ENV['NEO4J_TEST_HOST'] : ENV['NEO4J_HOST']
port = test ? ENV['NEO4J_TEST_PORT'] : ENV['NEO4J_PORT']

Neography.configure do |config|
  config.server = host
  config.port   = port
  config.username = ENV['NEO4J_USER']
  config.password = ENV['NEO4J_PASS']
end
