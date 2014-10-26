test = Rails.env.test?
host = test ? ENV['NEO4J_TEST_HOST'] : ENV['NEO4J_HOST']
port = test ? ENV['NEO4J_TEST_PORT'] : ENV['NEO4J_PORT']

Neography.configure do |config|
  config.server = host
  config.port   = port
end
