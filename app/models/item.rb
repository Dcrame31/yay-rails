class Item < ApplicationRecord
    belongs_to :list
    accepst_nested_attributes_for :list
end
