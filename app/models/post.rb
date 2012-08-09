class Post < ActiveRecord::Base
  attr_accessible :title,
                  :path

  has_many        :statistics, dependent: :destroy
end
