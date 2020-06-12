class SessionsController < ApplicationController

    def new
    end

    def create 
        @user = User.find_by(username:params[:user][:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to users_path
         else
            render 'new'
         end
    end

    def destroy
        if logged_in?      
            session[:user_id] = nil
            redirect_to root_path
        end
    end

    private

    def session_params
        params.require(:session).permit(:username, :password)
    end


end
