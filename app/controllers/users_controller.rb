class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
    end

    def edit
    end

    def update
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
