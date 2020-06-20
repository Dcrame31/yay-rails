module ListsHelper
    def list_empty?
        if current_user.lists.empty?
            "You currently do not have any lists."
        end
    end
end
