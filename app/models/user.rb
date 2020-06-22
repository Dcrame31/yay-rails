class User < ApplicationRecord
    has_many :lists
    has_many :categories
    has_many :items, through: :lists
    validates :email, :presence => true
    validates :username, :presence => true, :uniqueness => true
    validates :password, :presence => true
    has_secure_password
    

    def self.find_or_create_by_omniauth(auth_hash)
        where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end

   
            # if @user = User.find_by(:email => auth_hash["info"]["email"])
            #     session[:user_id] = @user.id
            #     session[:name] = request.env['omniauth.auth']['info']['nickname']
            # else
            #     @user = User.new(:email => oauth_email, :password => SecureRandom.hex)
            #     if @user.save
            #         session[:user_id] = @user.id
            #         session[:name] = request.env['omniauth.auth']['info']['nickname']
            # end
    
    def self.current
        Thread.current[:user]
    end

    def self.current=(user)
        Thread.current[:user] = user
    end        

    def last_created_list
      self.lists.last(2)
    end

    def all_lists
      self.lists.all
    end

    def search(query)
        if query
          self.lists.where("name LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
        else
          all_lists
        end
      end
end




