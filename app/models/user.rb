class User < ApplicationRecord
    has_many :gardens
    has_secure_password
end
