class ListsController < ApplicationController
    before_action :require_login
    before_action :admin_access, only: [:index]

    def new
        @list = List.new :category_ids => params[:category_ids]
        # if params[:category_ids]
        #     @list = List.new(category_ids: params[:category_ids])
        # else
        #     @list = List.new
        # end
        
        list_builder
        @list.categories.build

        # if params[:category_ids]
        #     @category = current_user.categories.find(params[:category_ids]) 
        #     @list.update(category_ids: @category)
        # end
        # if params[:category_ids]
        #     @category = current_user.categories.find_by_id(params[:category_ids])
        #     @list = List.new if @category
        #     @list.update(category_ids: @category)
        #     list_builder
        #     @list.categories.build
        # else
        #     @list = List.new
        # end
    end

    def create
        @list = List.create(list_params)
        if @list.valid?
            redirect_to list_path(@list)
        else
            render :new
        end
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
        
        if admin?
            admin_access
        else
            regular_user_access
        end
    end

    def edit
        @list = List.find_by_id(params[:id])

        list_builder
    end

    def update
        @list = List.find_by_id(params[:id])
        clear_content
        @list.update(list_params)
        if @list.valid?
            redirect_to @list
        else
            render 'edit'
        end
    end

    def destroy
        @list = List.find_by(id:params[:id])
        @list.items.clear
        @list.destroy!
        redirect_to root_path
    end

    private

    def list_params
        params.require(:list).permit(:name, :budget, :description, :user_id, category_ids:[], 
            categories_attributes:[
                :name, 
                :user_id
                ], 
            items_attributes:[
                :name, 
                :price,
                :qty,
                :list_id
                ]
            )
    end

    def list_builder
        5.times do 
            @list.items.build 
        end
    end

    def clear_content
        @list.category_ids.clear
        @list.items.clear
    end

    def admin_access
        if params[:category_ids]
            @category = Category.all.find_by(id:params[:id])
            @list = @category.lists.find(params[:id]) if @category
            @item = Item.new
            if !@list
                message("List not found")
                redirect_to categories_path
            end
        else
            @list = List.all.find_by(id:params[:id])
            @item = Item.new
            if !@list
                redirect_to lists_path
            end
        end
    end

    def regular_user_access
        if params[:category_ids]
            @category = current_user.categories.find(params[:category_ids]) 
            @list = @category.lists.find(params[:id]) if @category
            @item = Item.new
                if !@list
                    message("List not found")
                    redirect_to @category
                end
        else
            @list = current_user.lists.find_by(id:params[:id])
            @item = Item.new
            if !@list
                message("List not found")
                redirect_to root_path
            end
        end
    end
end
