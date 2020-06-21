class UsersController < ApplicationController
    # before_action :require_login

    def index
        @category = Category.new
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            session[:name] = @user.username
            message("You are now logged in.")
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :admin)
    end

end
