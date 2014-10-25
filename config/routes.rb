Rails.application.routes.draw do
  mount Sidekiq::Web => '/workers'

  namespace :oauth do
    resources :token, only: [:create]
  end
end
