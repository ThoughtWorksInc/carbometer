class Provider::PostFeed

  def self.find_all
    current_page = 1
    feed = nil

    while response = page(current_page)
      current_page += 1

      if feed
        feed.entries << response.entries
      else
        feed = response
      end
    end

    feed.entries.flatten
  end

  def self.page(page_number = 1)
    feed_url = ENV['RSS_FEED_URL'] ||= 'http://blog.carbonfive.com/feed'
    feed_url = "#{feed_url}/?paged=#{page_number}"

    Feedzirra::Feed.fetch_and_parse feed_url
  end

  class << self
    alias_method :find_latest, :page
  end

end
