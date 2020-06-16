class Item < ApplicationRecord
    belongs_to :list
    # accepts_nested_attributes_for :list
end
