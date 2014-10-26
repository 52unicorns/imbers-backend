Neography.configure do |config|
  config.server = ENV['NEO4J_HOST']
  config.port   = ENV['NEO4J_PORT']
end
