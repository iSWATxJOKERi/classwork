class ApplicationController < ActionController::Base
    helper_method :current_user, :login!, :logout!

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
        redirect_to user_url(user)
    end

    def logout!
        current_user.reset_session_token!
        @current_user = nil
        session[:session_token] = nil
        redirect_to new_session_url
    end
end
