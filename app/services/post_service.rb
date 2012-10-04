class PostService

  def self.reset_posts
    Post.destroy_all
    self.update_posts
  end

  def self.update_posts
    count = 0

    last_run_date = Statistic.maximum(:end_date) || Date.today - 30.days
    ((last_run_date+1)..(Date.today-1)).each do |date|
      sleep 30
      post_analytics = Provider::PostAnalytics.find_all_by_date_range date, date
      count += import_post_statistics post_analytics
    end

    count
  end

  def self.import_post_statistics(all_post_analytics)
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

    all_post_analytics.length
  end

  def self.import_posts
    feed = Provider::PostFeed.find_all
    posts = []

    feed.entries.each do |feed_entry|
      post = Post.find_or_create_by_title_and_path(
        title: feed_entry.title,
        path: URI(feed_entry.url).path
      )
      posts << post
      author = User.find_or_create_by_name({
        name: feed_entry.author
      })
      post.published_at = feed_entry.published
      post.author = author
      post.save
    end

    posts
  end

end
