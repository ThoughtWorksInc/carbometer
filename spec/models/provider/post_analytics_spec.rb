require 'spec_helper'

describe Provider::PostAnalytics do
  describe '::find_all_today' do
    before do
      @start_date = Date.today
    end

    it 'returns page analytics for today' do
      Provider::PostAnalytics.should_receive(:find_all_by_date_range).with(@start_date, @start_date)
      Provider::PostAnalytics.find_all_today
    end
  end

  describe '::find_all' do
    before do
      @start_date = Date.today - 1.year
      @end_date = Date.today
    end

    it 'returns page analytics from the past year' do
      Provider::PostAnalytics.should_receive(:find_all_by_date_range).with(@start_date, @end_date)
      Provider::PostAnalytics.find_all
    end
  end

  describe '::find_all_by_date_range' do
    before do
      stub_requests_for(:google)

      @page_view_data = Provider::PostAnalytics.find_all_by_date_range(Date.today, Date.today)
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
      @post = Provider::PostAnalytics.new
      @post.page_title = original_title
    end

    it 'removes the name of the website from the title' do
      expect(@post.page_title).to_not include(' | The Carbon Emitter')
    end
  end
end
