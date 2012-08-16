require 'webmock/rspec'

def stub_requests_for(requests_for)
  self.send("stub_requests_for_#{requests_for}")
end

def stub_requests_for_google
  Google::APIClient::PKCS12.stub(:load_key) do |keyfile, passphrase|
    OpenSSL::PKey::RSA.new 1024
  end

  stub_request(:post, "https://accounts.google.com/o/oauth2/token").
    to_return(status: 200,
              body: fixture_for('oauth.json'))

  stub_request(:get, "https://www.googleapis.com/discovery/v1/apis/analytics/v3/rest").
    to_return(status: 200,
              body: fixture_for('discovery.json'))

  stub_request(:get, /www\.googleapis\.com\/analytics\/v3\/data\/ga/).
    to_return(status: 200,
              body: fixture_for('google_analytics.json'),
              headers: {'Content-Type' => 'application/json'})
end

def stub_requests_for_rss_feed
  # Feedzirra uses Curb as its http client. Unfortunately Curb is not a client that Webmock supports
  # so the following is some hackery to get it to play nice with external services.
  Feedzirra::Feed.stub(:fetch_and_parse) do |url|
    response = Net::HTTP.get_response(URI.parse(url))
    if response.code == '200'
      Feedzirra::Feed.parse response.body
    else
      nil
    end
  end

  stub_request(:get, /blog.carbonfive.com/).
    to_return(status: 200,
             body: fixture_for('rss.xml'))

  stub_request(:get, "http://blog.carbonfive.com/feed/?paged=3").
    to_return(status: 404)
end
