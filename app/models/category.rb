class Category < ApplicationRecord
    belongs_to :user
    has_many :lists_categories
    has_many :lists, through: :lists_categories
    validates :name, :presence => true
    
end
