class ListsController < ApplicationController
    before_action :require_login

    def new
        @list = List.new
        @list.categories.build
        @list.items.build
        @list.items.build
        @list.items.build
        @user = current_user
    end

    def create
        @list = List.create(list_params)
        
        redirect_to list_path(@list)
    end 

    def show
        # if params[:category_id]
        #   @category = current_user.categories.find_by(id: params[:category_id]) 
        #   @list = @category.lists.find_by(id: params[:id]) if @category
        #   if !@list
        #   # if @artist && !(@song = @artist.songs.find_by(id: params[:id]))
        #     message("List not found")
        #     redirect_to category_lists_path(@category)
        #   end
        # else
        #   @list = List.find(params[:id])
        # end
        @list = List.find_by_id(params[:id])
      end

    private

    def list_params
        params.require(:list).permit(:name, :budget, :description, :user_id, category_ids:[], category_attributes:[:name], item_attributes:[:name, :price])
    end
end
