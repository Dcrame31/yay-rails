class SessionsController < ApplicationController

    def new
    end

    def create 
        if auth_hash = request.env["omniauth.auth"]
            oauth_email = request.env["omniauth.auth"]["info"]["email"]
            if @user = User.find_by(:email => oauth_email)
                session[:user_id] = @user.id
                session[:name] = request.env['omniauth.auth']['info']['nickname']
                redirect_to categories_path
            else
                @user = User.new(:email => oauth_email, :password => SecureRandom.hex)
                if @user.save
                    session[:user_id] = @user.id
                    session[:name] = request.env['omniauth.auth']['info']['nickname']
                    redirect_to categories_path
                end
            end
        else
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to categories_path
            else
                render 'new'
            end
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
        params.require(:session).permit(:name, :email, :password)
    end


end
