class DashboardsController < ApplicationController

  def show
    @posts = Post.in_default_date_range
  end

end
