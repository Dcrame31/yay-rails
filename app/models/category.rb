class Category < ApplicationRecord
    has_many :plants
    has_many :gardens, through: :plants
end
