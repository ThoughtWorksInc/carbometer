require 'webmock/rspec'

def stub_requests_for(requests_for)
  self.send("stub_requests_for_#{requests_for}")
end

def stub_requests_for_google
  stub_request(:post, "https://accounts.google.com/o/oauth2/token").
    to_return(status: 200,
              body: fixture_for('oauth'))

  stub_request(:get, "https://www.googleapis.com/discovery/v1/apis/analytics/v3/rest").
    to_return(status: 200,
              body: fixture_for('discovery'))

  stub_request(:get, /www\.googleapis\.com\/analytics\/v3\/data\/ga/).
    to_return(status: 200,
              body: fixture_for('google_analytics'),
              headers: {'Content-Type' => 'application/json'})
end
