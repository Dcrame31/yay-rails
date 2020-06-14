class Category < ApplicationRecord
    has_many :lists_categories
    has_many :lists, through: :lists_categories

    
end
