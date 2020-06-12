class Garden < ApplicationRecord
    belongs_to :user
    has_many :plants
    has_many :categories, through: :plants
end
