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

  describe '::import_post_statistics' do
    before do
      source_one = Provider::PostAnalytics.new({
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

      @imported_statistics_count = PostService.import_post_statistics post_analytics
      @imported_posts = Post.find_all_by_title 'title'
    end

    it 'associates multiple sources to single post' do
      expect(@imported_posts.length).to equal(1)
      expect(@imported_posts.first.statistics.length).to equal(2)
    end

    it 'returns the number of statistics imported' do
      expect(@imported_statistics_count).to equal(2)
    end
  end

  describe '::import_posts' do
    before do
      @title = 'Title'
      @author = FactoryGirl.build :user
      @path = '/1/2/3/'
      @published_at = Time.now

      feed_entry = double(
        title: @title,
        url: "http://blog.carbonfive.com#{@path}",
        published: @published_at,
        author: @author.name
      )
      feed = double(
        entries: [feed_entry]
      )
      Provider::PostFeed.stub(:find_all).and_return(feed)
    end

    context 'given existing posts' do
      before do
        @existing_post = FactoryGirl.create :post,
          title: @title,
          path: @path
        @author.save
        @imported_post = PostService.import_posts.first
      end

      it 'does NOT create a duplicate post' do
        expect(Post.find_all_by_path(@path).length).to eq(1)
      end

      it 'does NOT create a duplicate user' do
        expect(User.find_all_by_name(@author.name).length).to eq(1)
      end

      it 'associates an author with existing post' do
        expect(@imported_post.author.name).to eq(@author.name)
      end

      it 'truncates the post URL as path' do
        expect(@imported_post.path).to eq(@path)
      end

      it 'sets the publishing date for existing post' do
        expect(@imported_post.published_at).to eq(@published_at)
      end
    end

    context 'NOT given existing posts' do
      before do
        @imported_posts = PostService.import_posts
      end

      it 'imports posts from an RSS feed' do
        expect(@imported_posts.length).to eq(1)
        @imported_posts.each do |post|
          expect(post.author.name).to eq(@author.name)
          expect(post.title).to eq(@title)
          expect(post.path).to eq(@path)
          expect(post.published_at).to eq(@published_at)
        end
      end
    end
  end

end
