class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create]
  def index
  end

  def list
    @users = UsersService.listAll
  end

  def create
    id = session[:user_id]
    isSaveUser = UsersService.createArticle(user_params, id)
      if isSaveUser
        redirect_to action: :list
      else
        render 'new'
      end
  end

  def delete
    UsersService.deleteUser(params[:id])
    redirect_to :action => 'list'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :user_type, :phone, :dob, :address, :profile)
  end

end
