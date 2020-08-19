class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            login!(@user)
        else
            flash.now[:errors] = ["Invalid Credentials"]
            render :new, status: 422
        end
    end

    def destroy
        logout! if current_user
    end
end