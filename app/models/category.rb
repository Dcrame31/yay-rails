class Category < ApplicationRecord

    has_many :lists_categories
    has_many :lists, through: :lists_categories
    belongs_to :user
    # validates :name, :presence => true
    
end
