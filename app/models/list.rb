class List < ApplicationRecord
    has_many :lists_categories
    has_many :categories, through: :lists_categories
    has_many :items
    # accepts_nested_attributes_for :categories
    accepts_nested_attributes_for :items
    # validates :name, :presence => true
    # validates :budget, :presence => true
    validates :category_ids, :presence => true

    # def categories_attributes=(category_attributes)
    #     category_attributes.values.each do |category_attribute|
    #       category = Category.find_or_create_by(category_attribute) 
    #       self.categories << category
    #     end
    # end

    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
          if category_attribute[:name].present?
            category = Category.find_or_create_by(category_attribute)
            self.categories << category
          end
        end
    end
end
