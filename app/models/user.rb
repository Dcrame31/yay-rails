class User < ApplicationRecord
    has_many :budgets
    has_many :lists
    has_many :categories, through: :lists
    has_secure_password

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end
    
end
