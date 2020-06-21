class ItemsController < ApplicationController

    def new
        @item = Item.new
        @item.lists.build
    end

    def create
        @item = Item.create(item_params)
        if @item.valid?
            redirect_to list_path(@item.list_id)
        else
            message("Item not valid.")
            redirect_to list_path(@item.list_id)
        end
    end

    private

    def item_params
        params.require(:item).permit(:name, :qty, :price, :list_id)
    end
end
