module CategoriesHelper

    def category_empty?
        if current_user.categories.empty?
            "You currently do not have any categories."
        end
    end
end
