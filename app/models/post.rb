class Post < ActiveRecord::Base

  attr_accessible :title,
                  :path
  has_many        :statistics, dependent: :destroy
  belongs_to      :author, foreign_key: :user_id

  def cumulative_visit_count
    statistics.sum(:visit_count)
  end

  def self.popular
    Post.find(:all,
              joins: :statistics,
              select: 'posts.*, SUM(statistics.visit_count) as visit_sum',
              group: 'posts.id, posts.title, posts.path',
              limit: 10,
              order: 'visit_sum desc')
  end

end
