class PostsController < ApplicationController
  skip_before_action :authorize, only: [:create]

  def new
    @post = PostsService.newPost
  end
  
  def confirm
    @post = PostsService.confirmPost(post_params)
    render 'confirmPost'
  end

  def create
    id = session[:user_id]
    isSavePost = PostsService.createPost(post_params, id)
    if isSavePost != nil
      redirect_to action: :list
    else
      redirect_to posts_new_path , notice: "Duplicate record are not inserted."
    end
  end

  def show
    @post = PostsService.showPost(params[:id])
    render 'showDetail'
  end

  def list
    @posts = PostsService.listAll.paginate(page: params[:page], per_page:7)
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
      render :edit, notice: "Duplicate record are not inserted."
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
    @posts = PostsService.searchPost(params[:search]).paginate(page: params[:page], per_page:7)
      render 'list'
  end

  def import
    Post.import(params[:file])
    redirect_to :action => 'list'
  end

  def export
    respond_to do |format|
      format.html
      format.xls {send_data Post.to_excel(col_sep: "\t") }
    end
end

  private

  def post_params
    params.require(:post).permit( :title, :description, :status)
  end

end

