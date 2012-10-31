class PostsController < ApplicationController
  respond_to :json

  def index
    @posts = Post.popular
    respond_with @posts
  end
end
