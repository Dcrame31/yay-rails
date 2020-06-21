class List < ApplicationRecord
    has_many :lists_categories
    has_many :categories, through: :lists_categories
    has_many :items
    validates :name, :presence => true
    validates :budget, :presence => true
    validates :categories, :presence => true 
    validates_uniqueness_of :name, scope: :user_id, :case_sensitive => false

    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
          if category_attribute[:name].present?
            category = User.current.categories.find_or_create_by(category_attribute)
            self.categories << category
          end
        end
    end

    def items_attributes=(item_attributes)
        item_attributes.values.each do |item_attribute|
          if item_attribute[:name].present?
            item = Item.find_or_create_by(item_attribute)
            self.items << item
          end
        end
    end

    def list_cost
      self.items.reduce(0) do |s, item|
        s += item.item_cost.to_i
      end
    end

    def budget_over
      self.list_cost.to_i - self.budget.to_i
    end

    def budget_under
      self.budget.to_i - self.list_cost.to_i
    end

    def budget_result
      if self.list_cost.to_i > self.budget.to_i
        "You are $#{budget_over} over budget!"
      elsif self.list_cost.to_i < self.budget.to_i
        "You are $#{budget_under} under budget!"
      else
        "You are right on budget!"
      end
    end

end
