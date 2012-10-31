json.array!(@posts) do |post|
  json.title post.title
  json.path post.path
  json.published_at post.published_at
  json.statistics post.statistics do |statistic|
    json.visit_count statistic.visit_count
  end
end
