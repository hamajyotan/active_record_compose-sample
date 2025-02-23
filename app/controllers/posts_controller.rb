class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order(id: :desc)
  end
end
