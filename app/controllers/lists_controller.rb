class ListsController < ApplicationController
    before_action :require_login

    def new
        @list = List.new
        
        list_builder

        @list.categories.build
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
        @list = List.find_by_id(params[:id])
      end

      def edit
        @list = List.find_by_id(params[:id])

        # list_builder
      end

      def update
        @list = List.find_by_id(params[:id])
        @list.update(list_params)
        if @list.valid?
            redirect_to @list
        else
            render 'edit'
        end
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
                :qty
                ]
            )
    end

    def list_builder
        5.times do 
            @list.items.build 
        end
    end

end
