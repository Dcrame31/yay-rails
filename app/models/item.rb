class Item < ApplicationRecord
    belongs_to :list
    validates :name, :presence => true
    validates :price, :presence => true
    # accepts_nested_attributes_for :list
end
