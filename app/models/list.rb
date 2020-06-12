class List < ApplicationRecord
    belongs_to :user
    has_many :lists_categories
    has_many :categories, through: :lists_categories
    has_many :items
end
