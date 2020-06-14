class SessionsController < ApplicationController
    before_action :require_login, :only => [:destroy]

    def new
        if logged_in?
            redirect_to root_path
        else
            render 'new'
        end
    end

    def create 
        if auth_hash = request.env["omniauth.auth"]
            @user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = @user.id
            session[:name] = auth_hash['info']['nickname']
            flash[:message] = "You are now logged in via Github."
            redirect_to root_path
        else
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                flash[:message] = "You are now logged in."
                redirect_to root_path
            else
                render 'new'
            end
         end
    end

    

    def destroy
        reset_session
        redirect_to root_path
    end

    private

    def session_params
        params.require(:session).permit(:name, :email, :password)
    end


end
