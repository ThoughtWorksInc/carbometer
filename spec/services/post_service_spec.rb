require 'spec_helper'

describe PostService do
  describe '::reset_posts' do
    before do
      stub_requests_for(:google)
      @existing_post = FactoryGirl.create :post, :statistics
      PostService.reset_posts
      # This title was pulled from the json fixture for webmock
      @new_post = Post.find_by_title('Using Open Source Static Libraries in Xcode 4')
    end

    it 'deletes existing posts' do
      expect {Post.find(@existing_post.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'creates new posts from analytics data' do
      expect(@new_post).to_not be_nil
    end
  end

  describe '::import_posts' do
    before do
      source_one = PostAnalytics.new({
        page_title: 'title',
        page_path: 'path',
        visits: 1,
        source: 'one',
        start_date: Date.today,
        end_date: Date.today
      })
      source_two = source_one.clone
      source_two.source = 'two'
      post_analytics = [source_one, source_two]
      PostService.import_posts post_analytics

      @imported_posts = Post.find_all_by_title 'title'
    end

    it 'associates multiple sources to single post' do
      expect(@imported_posts.length).to equal(1)
      expect(@imported_posts.first.statistics.length).to equal(2)
    end
  end
end
