class AuthsController < ApplicationController
    skip_before_action :authorize, only: [:login, :authenticate, :logout]
    def login
    end

    def authenticate
        @user = User.find_by(email: params[:email])

        if @user && @user.password == params[:password]
            session[:user_id] = @user.id
            session[:user_name] = @user.name
            redirect_to posts_list_path
        else
            message = "Something went wrong! Please Check your email or password."
            redirect_to request.referer, notice: message
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to root_path
    end


end
