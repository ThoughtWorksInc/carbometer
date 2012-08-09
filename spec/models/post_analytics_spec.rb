require 'spec_helper'

describe PostAnalytics do
  describe '::find_all_today' do
    before do
      @start_date = Date.today
    end

    it 'returns page analytics for today' do
      PostAnalytics.should_receive(:find_all_by_date_range).with(@start_date, @start_date)
      PostAnalytics.find_all_today
    end
  end

  describe '::find_all' do
    before do
      @start_date = Date.today - 1.year
      @end_date = Date.today
    end

    it 'returns page analytics from the past year' do
      PostAnalytics.should_receive(:find_all_by_date_range).with(@start_date, @end_date)
      PostAnalytics.find_all
    end
  end

  describe '::find_all_by_date_range' do
    before do
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

      @page_view_data = PostAnalytics.find_all_by_date_range(Date.today, Date.today)
    end

    it 'returns page analytics' do
      expect(@page_view_data).to_not be_empty
      expect(@page_view_data.length).to be(10)
      @page_view_data.each do |data|
        expect(data.page_title).to_not be_blank
        expect(data.page_path).to_not be_blank
        expect(data.visits).to_not be_blank
        expect(data.source).to_not be_blank
        expect(data.start_date).to_not be_blank
        expect(data.end_date).to_not be_blank
      end
    end
  end

  describe '#page_title' do
    before do
      original_title = 'Using Open Source Static Libraries in Xcode 4 | The Carbon Emitter'
      @post = PostAnalytics.new
      @post.page_title = original_title
    end

    it 'removes the name of the website from the title' do
      expect(@post.page_title).to_not include(' | The Carbon Emitter')
    end
  end
end
