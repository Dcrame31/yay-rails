module ListsHelper

    def highest_budget
        current_user.lists.highest_budget.pluck(:budget).join(',')
    end

    def most_expensive_list
        current_user.lists.highest_budget.pluck(:name).join(',')
    end

    def most_expensive_list_object
        @list = current_user.lists.find_by(name: most_expensive_list)
    end

    def list_info
        if current_user.lists.empty?
            "You currently do not have any lists."
        # else
            # "Your biggest budget is $#{highest_budget} for #{link_to most_expensive_list, list_path(most_expensive_list_object)}"
        end
    end

end
