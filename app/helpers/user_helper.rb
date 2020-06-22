module UserHelper
    def lists_empty?
        current_user.lists.nil?
    end
    
end
