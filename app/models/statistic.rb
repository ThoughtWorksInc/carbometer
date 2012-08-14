class Statistic < ActiveRecord::Base

  attr_accessible :source,
                  :start_date,
                  :end_date,
                  :visit_count
  belongs_to      :post

end
