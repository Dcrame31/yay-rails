class User < ApplicationRecord
    has_many :budgets
    has_many :lists
    has_many :categories, through: :lists
end
