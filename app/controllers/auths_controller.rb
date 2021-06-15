class AuthsController < ApplicationController
    def login
    end

    def authenticate
        @user = User.find_by(email: params[:email])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to posts_list_path
        else
            message = "Something went wrong! Please Check your email or password"
            redirect_to request.referer, notice: message
        end
    end

end
