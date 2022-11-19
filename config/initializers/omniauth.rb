Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
  OmniAuth.config.allowed_request_methods = [:get, :post]
  OmniAuth.config.silence_get_warning = true
end
