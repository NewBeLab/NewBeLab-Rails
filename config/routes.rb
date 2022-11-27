Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        resources :sessions, only: %i[index]
      end
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        omniauth_callback: 'overrides/omniauth_callback'
      }

      resources :profiles, only: %i[index show edit update]
    end
  end
end
