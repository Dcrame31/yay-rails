class CategoriesController < ApplicationController

    def index
        
    end

    def new
        @user = current_user
        @category = Category.new
    end

    def create
        @category = Category.create(category_params)
        if @category.valid?
            message("Successfully created category.")
            redirect_to root_path
        else
            render '/categories/new'
        end
    end

    def edit
    end
    
    def update
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

end
