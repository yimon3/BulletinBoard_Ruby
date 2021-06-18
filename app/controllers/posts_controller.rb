class PostsController < ApplicationController
  skip_before_action :authorize, only: [:create]
  def index
  end

  def new
    @post = PostsService.newPost
  end

  def create
    id = session[:user_id]
    isSavePost = PostsService.createPost(post_params, id)
    if isSavePost
      redirect_to action: :list
    else
      render 'new'
    end
  end

  def show
    @post = PostsService.showPost(params[:id])
  end

  def list
    @posts = PostsService.listAll
  end

  def edit
    @post = PostsService.editPost(params[:id])
  end

  def update
    user_id = session[:user_id]
    isUpdatePost = PostsService.updatePost(params[:id], post_params, user_id)
    if isUpdatePost
      redirect_to posts_list_path
    else
      render 'edit'
    end
  end

  def delete
    PostsService.deletePost(params[:id])
    redirect_to :action => 'list'
  end

  def upload
  end

  private

  def post_params
    params.require(:post).permit( :title, :description)
  end

end