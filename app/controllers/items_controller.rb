class ItemsController < ApplicationController

    def new
        @item = Item.new
        @item.lists.build
    end

    def create
        @item = Item.create(item_params)
        redirect_to list_path(@item.list_id)
    end

    private

    def item_params
        params.require(:item).permit(:name, :qty, :price, :list_id)
    end
end
