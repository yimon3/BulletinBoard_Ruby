class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create]
  
  def list
    @users = UsersService.listAll.paginate(page: params[:page], per_page:5)
  end

  def confirm
    @user = User.new(user_params)
    render 'confirmUser'
  end

  def create
    id = session[:user_id]
    isSaveUser = UsersService.createUser(user_params, id)
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

  def showProfile
    id = session[:user_id]
    @user = UsersService.showProfile(id)
    render 'profile'
  end

  def editProfile
    @user = UsersService.editProfile(params[:id])
  end

  def update
    user_id = session[:user_id]
    isUpdateProfile = UsersService.updateProfile(params[:id], user_params, user_id)
    if isUpdateProfile 
      redirect_to :action => 'list'
    else
      render 'editProfile'
    end
  end

  def search
    if params[:name]
      @users = UsersService.searchUserByName(params[:name]).paginate(page: params[:page], per_page:5)
    elsif params[:email]
      @users = UsersService.searchUserByEmail(params[:email]).paginate(page: params[:page], per_page:5)
    end
    render 'list'
  end

  private

  def user_params
    params.require(:user).permit( :name, :email, :password, :user_type, :phone, :dob, :address, :profile)
  end

end
