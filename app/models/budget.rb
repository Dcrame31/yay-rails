class Budget < ApplicationRecord
    has_many :garden_plants
    has_many :gardens, through: :garden_plants
    belongs_to :category
end
