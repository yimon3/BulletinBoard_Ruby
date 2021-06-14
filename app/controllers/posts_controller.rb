class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: :list
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def list
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end