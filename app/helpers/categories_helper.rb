module CategoriesHelper

    def category_empty?
        if Category.all.empty?
            "You currently do not have any categories."
        end
    end
end
