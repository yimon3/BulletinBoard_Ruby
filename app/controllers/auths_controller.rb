class AuthsController < ApplicationController
    skip_before_action :authorize, only: [:login, :authenticate, :logout]
    def login
    end

    def authenticate
        @user = User.find_by(email: params[:email])

        if @user && @user.password == params[:password]
            session[:user_id] = @user.id
            session[:user_name] = @user.name
            if @user.user_type == 0
                session[:user_type] = 'Admin'
            else
                session[:user_type] = 'User'
            end
            session[:user_email] = @user.email
            session[:user_phone] = @user.phone
            session[:user_dob] = @user.dob
            session[:user_address] = @user.address
            redirect_to posts_list_path
        else
            redirect_to request.referer, notice: "Something went wrong! Please Check your email or password."
        end
    end

    def logout
        session[:user_id] = nil
        session[:user_name] = 'Username'
        redirect_to root_path
    end

    def updatePsw
        @user = User.find(session[:user_id])
        password = params[:password]
        newPassword = params[:newPassword]
        confirmPassword = params[:confirmPassword]
        if password == @user.password
            if  newPassword == confirmPassword
                @user.password = confirmPassword
                @user.save
                redirect_to :action => 'list', :controller=> 'posts'
            else
                render 'changePsw', notice: "New password and confirm password must be same."
            end
        else
            render 'changePsw', notice: "Please enter your old password."
        end
    end

end
