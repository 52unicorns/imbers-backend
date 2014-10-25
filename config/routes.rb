Rails.application.routes.draw do
  mount Sidekiq::Web => '/workers'

  namespace :oauth do
    resources :token, only: [:create]
    resources :revoke, only: [:create]
  end
end
