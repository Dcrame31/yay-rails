class Plant < ApplicationRecord
    belongs_to :garden
    belongs_to :category
end
