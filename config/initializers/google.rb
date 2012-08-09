require 'google/api_client'

Carbometer::Application.configure do
  config.google_client_email = ENV['GOOGLE_CLIENT_EMAIL']
  config.google_client_secret = ENV['GOOGLE_CLIENT_SECRET']
  config.google_client_profile_id = ENV['GOOGLE_CLIENT_PROFILE_ID']
  config.google_client_key_file = ENV['GOOGLE_CLIENT_KEY_FILE']
end
