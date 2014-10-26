Rails.application.routes.draw do
  mount Sidekiq::Web => '/workers'

  namespace :oauth do
    resources :token, only: [:create]
    resources :revoke, only: [:create]
    resource :test, only: [:show]
  end

  namespace :api do
    namespace :v0 do
      resources :matches, only: [:index, :show] do
        resources :reveal, only: [:create]
        resources :messages, only: [:create, :index]
      end
    end
  end
end
