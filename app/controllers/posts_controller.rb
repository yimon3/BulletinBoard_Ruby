class PostsController < ApplicationController
  skip_before_action :authorize, only: [:create]

  def new
    @post = PostsService.newPost
  end
  
  def confirm
    @post = Post.new(post_params)
    render 'confirmPost'
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
    render 'showDetail'
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

  def profile
  end

  def upload
  end
  
  def search
    keyword = params[:search]
    @posts = Post.where("title LIKE ?", "%#{keyword}%")
      render 'list'
  end

  def import
    Post.import(params[:file])
    redirect_to :action => 'list'
  end

  def export
    @posts =  Post.all
    respond_to do |format|
      format.html
      format.xlsx
    end
end

  private

  def post_params
    params.require(:post).permit( :title, :description, :status)
  end

end

