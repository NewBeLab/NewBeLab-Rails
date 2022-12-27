Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        omniauth_callbacks: 'api/v1/auth/omniauth_callbacks'
      }
      resources :profiles, only: %i[index show update], params: :user_id
      resources :tags, only: :index
      namespace :auth do
        resources :sessions, only: %i[index]
      end
    end
  end
end
