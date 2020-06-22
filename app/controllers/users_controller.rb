class UsersController < ApplicationController
    # before_action :require_login
    before_action :admin_access, only: [:users, :show, :edit, :delete]

    def index
        @category = Category.new
        @user = current_user
    end

    def users
        @user = current_user
        @users = User.all
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

    def show
        if admin?
            @user = User.all.find_by(id:[params[:id]])
        else
            redirect_to root_path
        end
    end

    def edit
        @user = User.all.find_by(id:[params[:id]])
    end

    def update
        @user = User.all.find_by(id:[params[:id]])
        @user.update(user_params)
        if @user.valid?
            redirect_to all_users_path
        else
            render 'show'
        end
    end

    def destroy
        User.find_by(id:params[:id]).destroy
        redirect_to all_users_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :admin)
    end

end
