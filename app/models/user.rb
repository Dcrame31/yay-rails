class User < ApplicationRecord
    has_many :budgets
    has_many :lists
    has_many :categories, through: :lists
    has_secure_password

    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.name
          user.email = auth.info.email
        end
    end
end
