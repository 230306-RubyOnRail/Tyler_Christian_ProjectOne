require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TylerChristianProjectone
  class Application < Rails::Application
    config.load_defaults 7.0

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://ror-crl-revature.s3-website.us-east-2.amazonaws.com'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end
  end
end
