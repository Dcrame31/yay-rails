class CategoriesController < ApplicationController

    def index
        current_user
    end

    def new
    end

    def create
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
