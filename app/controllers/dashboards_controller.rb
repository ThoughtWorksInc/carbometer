class DashboardsController < ApplicationController

  def show
    @posts = Post.popular
  end

end
