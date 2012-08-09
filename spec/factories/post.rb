FactoryGirl.define do
  factory :post do
    title 'title'
    path  '/a/b/c'

    trait :statistics do
      statistics {
        FactoryGirl.create_list :statistic, 10
      }
    end
  end


  factory :statistic do
    source      'google.com'
    start_date  {1.month.ago}
    end_date    {Date.today}
    visit_count 1
  end
end
