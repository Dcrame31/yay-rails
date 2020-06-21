class Item < ApplicationRecord
    belongs_to :list
    validates :name, :presence => true
    validates :price, :presence => true
    accepts_nested_attributes_for :list
    validate :zero?

    def item_cost
        if self.qty.to_i > 0
            self.qty.to_i * self.price.to_i
        else
            self.price.to_i
        end
    end

    def zero?
        if self.price.to_i < 0
            errors.add(:price, "Price can't be less than 0.")
        elsif self.price.to_i == 0
            errors.add(:price, "Price can't be negative.")
        end
    end
end
