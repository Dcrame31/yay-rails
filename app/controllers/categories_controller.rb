class CategoriesController < ApplicationController

    def index
        
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
