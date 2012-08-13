# Carbometer

## Setup
1. Create a Google Service Account for your Project (see [Google API Console](https://developers.google.com/analytics/devguides/reporting/core/v3/#best_registration))
2. Assign Service User Access from Google Analytics (see [Enabling Analytics Access](http://stackoverflow.com/questions/9863509/service-applications-and-google-analytics-api-v3-server-to-server-oauth2-authen))

## Required Environment Variables
1. `RAILS_SECRET_KEY`
    Rails secret key for signing cookies
2. `GOOGLE_CLIENT_EMAIL`
    API service account's email address
3. `GOOGLE_CLIENT_SECRET`
    API service account's private key secret
4. `GOOGLE_CLIENT_PROFILE_ID`
    Google Analytics Profile ID for your website
5. `GOOGLE_CLIENT_KEY_FILE`
    Location of your API service account's private key (PKCS12 File)
5. `GOOGLE_CLIENT_KEY`
    Alternate method for specifying the service account private key
    (PEM). To create a PEM file from a PKCS12 file, run the following
    command `openssl pkcs12 -in $your_key_file -out $your_key_file.pem`.
    Export the contents of the PEM file as an environment variable.
