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

    it 'returns at most 10 posts' do
      expect(@popular_posts.length).to equal(10)
    end

    it 'sorts by popularity' do
      @popular_posts.reduce(@popular_post.cumulative_visit_count) {|previous_visit_count, post|
        less_popular = post.cumulative_visit_count <= previous_visit_count
        expect(less_popular).to be(true)
        post.cumulative_visit_count
      }
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
