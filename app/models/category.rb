class Category < ApplicationRecord

    has_many :lists_categories
    has_many :lists, through: :lists_categories
    belongs_to :user
    accepts_nested_attributes_for :user
    accepts_nested_attributes_for :lists
    # validates :name, :presence => true
    
end
