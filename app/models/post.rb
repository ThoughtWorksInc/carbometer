class Post < ActiveRecord::Base

  DEFAULT_DAY_RANGE = 30

  attr_accessible :title,
                  :path,
                  :published_at
  has_many        :statistics, dependent: :destroy
  belongs_to      :author, foreign_key: :user_id, class_name: 'User'

  def cumulative_visit_count
    statistics.sum(:visit_count)
  end

  def self.popular
    Post.find(:all,
              joins: :statistics,
              select: 'posts.*, SUM(statistics.visit_count) as visit_sum',
              group: 'posts.id, posts.title, posts.path, posts.user_id, posts.published_at',
              limit: 10,
              order: 'visit_sum desc')
  end

  def self.in_default_date_range
    Post.joins(:statistics)
        .where('statistics.start_date >= ?', Date.today - DEFAULT_DAY_RANGE.days)
        .select('posts.*, SUM(statistics.visit_count) as visit_sum')
        .group('posts.id, posts.title, posts.path, posts.user_id, posts.published_at')
        .order('visit_sum DESC')
        .limit(10)
  end
end
