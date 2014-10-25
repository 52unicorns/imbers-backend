require 'sidekiq'
require 'sidekiq/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == [ENV['SIDEKIQ_USER'], ENV['SIDEKIQ_PASS']]
end

Sidekiq.configure_server do |config|
  config.redis = {:url => ENV['REDIS_URI'], :namespace => 'imbers'}
end

Sidekiq.configure_client do |config|
  config.redis = {:url => ENV['REDIS_URI'], :namespace => 'imbers'}
end
