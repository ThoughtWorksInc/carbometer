# Carbometer, rebooted! #

# Setup
1 Create a Google Service Account for your Project (see
https://developers.google.com/analytics/devguides/reporting/core/v3/#best_registration)
2 Assign Service User Access from Google Analytics (see
http://stackoverflow.com/questions/9863509/service-applications-and-google-analytics-api-v3-server-to-server-oauth2-authen)

# Required Environment Variables
* RAILS_SECRET_TOKEN: Rails secret token for signing cookies
* GOOGLE_CLIENT_EMAIL: API service account's email address
* GOOGLE_CLIENT_SECRET: API service account's private key secret
* GOOGLE_CLIENT_PROFILE_ID: Google Analytics Profile ID for your website
* GOOGLE_CLIENT_KEY_FILE: Location of your API service account's
  private key
