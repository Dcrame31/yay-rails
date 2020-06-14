class SessionsController < ApplicationController
    # before_action :require_login, :only => [:destroy]

    def new
       
    end

    def create 
        # if auth_hash = request.env["omniauth.auth"]
        # #     oauth_email = request.env["omniauth.auth"]["info"]["email"]
        # #     if @user = User.find_by(:email => oauth_email)
        # #         session[:user_id] = @user.id
        # #         session[:name] = request.env['omniauth.auth']['info']['nickname']
        # #         # message = "You are now logged in" 
        # #         flash[:message] = "You are now logged in via github."
        # #         redirect_to root_path
        # #     else
        # #         @user = User.new(:email => oauth_email, :password => SecureRandom.hex)
        # #         if @user.save
        # #             session[:user_id] = @user.id
        # #             session[:name] = request.env['omniauth.auth']['info']['nickname']
        # #             redirect_to root_path
        # #         end
        # #     end
        # # else
        # #     @user = User.find_by(email: params[:email])
        # #     if @user && @user.authenticate(params[:password])
        # #         session[:user_id] = @user.id
        # #         redirect_to root_path
        # #         flash[:message] = "You are now logged in."
        # #     else
        # #         render 'new'
        # #     end
        # #  end

        if auth_hash = request.env["omniauth.auth"]
            @user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = @user.id
            session[:name] = auth_hash['info']['nickname']
            redirect_to root_path
        else
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to root_path
                # flash[:message] = "You are now logged in."
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
