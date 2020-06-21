module UserHelper

    def highest_budget
        current_user.lists.highest_budget.pluck(:budget).join(',')
    end

    def most_expensive_list
        current_user.lists.highest_budget.pluck(:name).join(',')
    end

    def most_expensive_list_object
        @list = current_user.lists.find_by(name: most_expensive_list)
    end
end
