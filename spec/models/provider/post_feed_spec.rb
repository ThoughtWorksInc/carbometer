require 'spec_helper'

describe Provider::PostFeed do

  describe '::page' do
    context 'by default' do
      before do
        stub_requests_for(:rss_feed)
        @feed = Provider::PostFeed.page
      end

      it 'returns the 10 latest posts' do
        expect(@feed.entries.length).to equal(10)
      end
    end
  end

  describe '::find_all' do
    before do
      stub_requests_for(:rss_feed)
      @feed = Provider::PostFeed.find_all
    end

    it 'returns a feed with all its posts' do
      expect(@feed.entries.length).to equal(20)
    end
  end

end
