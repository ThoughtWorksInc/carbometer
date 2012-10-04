namespace :posts do
  desc 'Delete all posts and import full set of post analytics data'
  task reset: :environment do
    p 'Resetting posts...'
    time_elapsed = Benchmark.realtime do
      count = PostService.reset_posts
      p "Imported #{count} post statistics."
      post_count = PostService.import_posts.length
      p "Imported #{post_count} posts."
    end
    p "Finished in #{time_elapsed} seconds"
  end

  task update: :environment do
    p 'Updating posts...'
    time_elapsed = Benchmark.realtime do
      count = PostService.update_posts
      p "Imported #{count} post statistics."
      post_count = PostService.import_posts.length
      p "Imported #{post_count} posts."
    end
    p "Finished in #{time_elapsed} seconds"
  end
end
