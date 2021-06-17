class PostsController < ApplicationController
  skip_before_action :authorize
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.create_user_id = session[:user_id]
    @post.updated_user_id = session[:user_id]
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.updated_user_id = session[:user_id]
    @post.updated_at = Time.now
    if @post.update(post_params)
      redirect_to posts_list_path
    else
      render 'edit'
    end
  end

  def delete
    Post.find(params[:id]).destroy
   redirect_to :action => 'list'
  end

  def upload
  end

  private

  def post_params
    params.require(:post).permit( :title, :description)
  end

end