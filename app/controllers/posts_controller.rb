class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
