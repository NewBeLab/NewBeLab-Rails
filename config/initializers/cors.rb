Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://new-be-lab.magia.runteq.jp'

    resource '*',
      headers: :any,
      expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
