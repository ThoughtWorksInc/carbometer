namespace :posts do
  desc 'Delete all posts and import full set of post analytics data'
  task reset: :environment do
    p 'Resetting posts...'
    time_elapsed = Benchmark.realtime do
      count = PostService.reset_posts
      p "Imported #{count} post statistics."
    end
    p "Finished in #{time_elapsed} seconds"
  end
end
