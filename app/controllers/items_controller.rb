class ItemsController < ApplicationController

    def create
        @item = Item.create(item_params)
    end

    private

    def item_params
        params.require[:item].permit(:name, :price, :list_id)
    end
end
