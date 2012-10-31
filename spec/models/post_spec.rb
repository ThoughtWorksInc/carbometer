require 'spec_helper'

describe Post do
  describe '::popular' do
    before do
      FactoryGirl.create_list :post, 10, :statistics
      @popular_post = FactoryGirl.create :post, :popular

      @popular_posts = Post.popular
    end

    it 'returns the most popular posts' do
      expect(@popular_posts.first).to eql(@popular_post)
    end

    it 'returns at most 8 posts' do
      expect(@popular_posts.length).to equal(8)
    end

    it 'sorts by popularity' do
      @popular_posts.reduce(@popular_post.cumulative_visit_count) {|previous_visit_count, post|
        less_popular = post.cumulative_visit_count <= previous_visit_count
        expect(less_popular).to be(true)
        post.cumulative_visit_count
      }
    end
  end

  describe '::in_default_date_range' do
    context 'there are loans with views in the default range' do
      before do
        @recent_post = FactoryGirl.create :post, published_at: Date.today
        FactoryGirl.create :statistic, post: @recent_post, visit_count: 150, start_date: Date.today - 1.day
        FactoryGirl.create :statistic, post: @recent_post, visit_count: 100, start_date: Date.today - 2.days
        FactoryGirl.create :statistic, post: @recent_post, visit_count: 150, start_date: Date.today - (Post::DEFAULT_DAY_RANGE + 1).days

        @still_recent_post = FactoryGirl.create :post, published_at: Date.today - Post::DEFAULT_DAY_RANGE.days
        FactoryGirl.create :statistic, post: @still_recent_post, visit_count: 100

        @default_posts = Post.in_default_date_range
      end

      it 'returns all posts sorted by visit counts' do
        expect(@default_posts) == [@recent_post, @still_recent_post]
      end

      it 'does not include statistics outside of the default range' do
        expect(@default_posts.first.visit_sum).to eql("250")
      end
    end

    context 'there are more than 8 loans with views in the default range' do
      before do
        FactoryGirl.create_list :post, 10, :statistics
      end

      it 'returns only 8 loans' do
        expect(Post.in_default_date_range.length).to equal(8)
      end
    end
  end

  describe '#cumulative_visit_count' do
    context 'by default' do
      before do
        @post = FactoryGirl.create :post
      end

      it 'returns zero' do
        expect(@post.statistics.length).to equal(0)
        expect(@post.cumulative_visit_count).to equal(0)
      end
    end

    context'given statistics' do
      before do
        @post = FactoryGirl.create :post
        FactoryGirl.create :statistic, post: @post, visit_count: 1
        FactoryGirl.create :statistic, post: @post, visit_count: 1
      end

      it 'returns the sum of all visit counts' do
        expect(@post.cumulative_visit_count).to equal(2)
      end
    end
  end
end
