module CategoriesHelper

    def category_empty?
        if current_user.categories.empty?
            "You currently do not have any categories."
        end
    end

    def category_lists_empty?
        if @category.lists.empty?
            "You currently do not have any lists in this category."
        end
    end
end
