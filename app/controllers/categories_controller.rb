class CategoriesController < ApplicationController

    def index
        
    end

    def new
        @category = Category.new
        @category.build_user
    end

    def create
        @category = Category.create(category_params)
        redirect_to root_path
    end

    def show
        @category = current_user.categories.find_by_id(params[:id])
    end

    def edit
        @category = Category.find_by(id:params[:id])
        @user = current_user
    end
    
    def update
        @category = Category.find_by(id:params[:id])
        @category.update(category_params)
        if @category.valid?
            redirect_to @category
        else
            render '/categories/edit'
        end
    end

    private

    def category_params
        params.require(:category).permit(:name, :user_id, user_attributes:[:username])
    end

end
