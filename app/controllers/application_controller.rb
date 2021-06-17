class ApplicationController < ActionController::Base
protected
before_action :authorize
def authorize
    unless User.find_by(id: session[:user_id])
        redirect_to root_path, notice:"You trying to unauthorize access."
    end
end

end
