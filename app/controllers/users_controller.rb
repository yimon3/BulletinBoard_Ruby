class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create]
  def index
  end

  def create
    @user = User.new(user_params)
    if @user.user_type == 'Admin'
      @user.user_type= 0
      @user.create_user_id = session[:user_id]
      @user.updated_user_id = session[:user_id]
      @user.save
      redirect_to action: :index
    elsif @user.user_type == 'User'
      @user.user_type= 1
      @user.create_user_id = session[:user_id]
      @user.updated_user_id = session[:user_id]
      @user.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def list
    @users = User.all
  end

  def delete
    Post.find(params[:id]).destroy
   redirect_to :action => 'list'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :user_type, :phone, :dob, :address, :profile)
  end
end
