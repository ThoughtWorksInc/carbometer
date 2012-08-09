class PostService

  def self.reset_posts
    Post.delete_all
    post_analytics = PostAnalytics.find_all
    import_posts post_analytics
  end

  def self.import_posts(all_post_analytics)
    all_post_analytics.each do |post_analytics|
      title = post_analytics.page_title
      path =  post_analytics.page_path

      post = Post.find_or_create_by_title_and_path title, path
      post.statistics.create({
        source: post_analytics.source,
        start_date: post_analytics.start_date,
        end_date: post_analytics.end_date,
        visit_count: post_analytics.visits
      })
    end
  end

end
