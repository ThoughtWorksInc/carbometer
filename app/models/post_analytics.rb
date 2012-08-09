class PostAnalytics
  TITLE_DELIMITER = ' |'

  attr_accessor :page_title,
                :page_path,
                :visits,
                :source,
                :start_date,
                :end_date

  def initialize(params = {})
    self.start_date = params[:start_date]
    self.end_date = params[:end_date]
  end

  def page_title
    @page_title.split(TITLE_DELIMITER).first
  end

  def self.find_all_recent
    start_date = Date.today - 30.days
    end_date = Date.today

    find_all_by_date_range start_date, end_date
  end

  def self.find_all_by_date_range(start_date, end_date)
    data = page_views(start_date, end_date)
    headers = data.column_headers.map(&:name)
    results = []

    data.rows.each_with_index do |row, index|
      post_analytics = new start_date: start_date,
                           end_date: end_date
      results << post_analytics
      headers.each_with_index do |header, header_index|
        property_name = headers[header_index].split(':').last.underscore
        post_analytics.send("#{property_name}=", row[header_index])
      end
    end
    results
  end

 private

  def self.page_views(start_date, end_date)
    service = client.discovered_api('analytics','v3')
    start_date = start_date.strftime("%Y-%m-%d")
    end_date = end_date.strftime("%Y-%m-%d")
    dimensions = 'ga:pageTitle,ga:pagePath,ga:source'
    metrics = 'ga:visits'
    sort = '-ga:visits'

    response  = client.execute(api_method: service.data.ga.get,
                               parameters: {
                                  'ids' => "ga:#{config.google_client_profile_id}",
                                  'start-date' => start_date,
                                  'end-date' => end_date,
                                  'dimensions' => dimensions,
                                  'metrics' => metrics,
                                  'sort' => sort,
                                  'max-results' => 1000
                                })
    response.data
  end

  def self.client
    api_client = Google::APIClient.new()
    key = Google::APIClient::PKCS12.load_key(config.google_client_key_file,
                                             config.google_client_secret)
    asserter = Google::APIClient::JWTAsserter.new(config.google_client_email,
                                                  'https://www.googleapis.com/auth/analytics.readonly',
                                                  key)
    api_client.authorization = asserter.authorize()
    api_client
  end

  def self.config
    Rails.application.config
  end

end
