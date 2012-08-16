FactoryGirl.define do

  factory :post do
    title 'title'
    path  '/a/b/c/'
    published_at {Time.now}

    trait :statistics do
      statistics {
        FactoryGirl.create_list :statistic, 10
      }
    end

    trait :popular do
      title 'Popular Post'
      statistics {
        [
          FactoryGirl.create(:statistic, visit_count: 1000000)
        ]
      }
    end
  end

  factory :statistic do
    source      'google.com'
    start_date  {1.month.ago}
    end_date    {Date.today}
    visit_count {rand(1...100)}
  end

end
