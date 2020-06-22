class Category < ApplicationRecord

    has_many :lists_categories
    has_many :lists, through: :lists_categories,
                dependent: :nullify
    belongs_to :user
    accepts_nested_attributes_for :user
    validates_uniqueness_of :name, scope: :user_id, :case_sensitive => false
    validates :name, :presence => true
    
    
end
