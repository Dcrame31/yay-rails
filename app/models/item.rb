class Item < ApplicationRecord
    belongs_to :list
    validates :name, :presence => true
    validates :price, :presence => true
    accepts_nested_attributes_for :list
    

    def item_cost
        if self.qty.to_f > 0
            self.qty.to_f * self.price.to_f
        else
            self.price.to_f
        end
    end

end
