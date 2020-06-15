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

    def edit
    end
    
    def update
    end

    private

    def category_params
        params.require(:category).permit(:name, :user_id, user_attributes:[:username])
    end

end
