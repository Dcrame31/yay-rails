class ItemsController < ApplicationController

    def new
        @item = Item.new
        @item.list_builder
    end

    def create
        @item = Item.create(item_params)
        redirect_to list_path(@item.list_id)
    end

    def show
        @category = current_user.items.find_by_id(params[:id])
    end

    private

    def item_params
        params.require[:item].permit(:name, :price, :qty, :list_id)
    end
end
