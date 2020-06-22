class CategoriesController < ApplicationController
    before_action :require_login
    before_action :admin_access, only: [:index]

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
        if admin?
            @category = Category.find_by(id:params[:id])
        else
            @category = current_user.categories.find_by(id:params[:id])
            if !@category
                message("Category not found.")
                redirect_to root_path
            end
        end
    end

    def edit
        @user = current_user
        if admin?
            @category = Category.find_by(id:params[:id])
        else
            @category = current_user.categories.find_by(id:params[:id])
        end
    end
    
    def update
        if admin?
            admin_category_update
        else
            regular_user_update
        end
    end

    def destroy
        Category.find_by(id:params[:id]).destroy
        redirect_to root_path
    end

    private

    def category_params
        params.require(:category).permit(:name, :user_id)
    end

    def admin_category_update
        @category = Category.all.find_by(id:params[:id])
        @category.update(category_params)
        if @category.valid?
            redirect_to categories_path
        else
            render '/categories/edit'
        end
    end

    def regular_user_update
        @category = current_user.categories.find_by(id:params[:id])
        @category.update(category_params)
        if @category.valid?
            redirect_to @category
        else
            render '/categories/edit'
        end
    end

end
