require 'google/api_client'

Carbometer::Application.configure do

  config.google_client_email      = ENV['GOOGLE_CLIENT_EMAIL']
  config.google_client_secret     = ENV['GOOGLE_CLIENT_SECRET']
  config.google_client_profile_id = ENV['GOOGLE_CLIENT_PROFILE_ID']

  # Private key in a PKCS12 file
  config.google_client_key_file   = ENV['GOOGLE_CLIENT_KEY_FILE']

  # Private key as a PEM string, for heroku-based deployments
  config.google_client_key        = ENV['GOOGLE_CLIENT_KEY']

  if config.google_client_key_file.blank?
    Google::APIClient::PKCS12.module_eval do
      def self.load_key(keyfile, passphrase)
        pem = Rails.application.config.google_client_key
        OpenSSL::PKey::RSA.new(pem, passphrase)
      end
    end
  end

end
