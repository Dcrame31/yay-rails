class List < ApplicationRecord
    has_many :lists_categories
    has_many :categories, through: :lists_categories
    has_many :items
    accepts_nested_attributes_for :categories
    # validates :name, :presence => true
    # validates :budget, :presence => true
end
