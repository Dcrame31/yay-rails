class List < ApplicationRecord
    has_many :lists_categories
    has_many :categories, through: :lists_categories
    has_many :items
    validates :name, :presence => true
    validates :budget, :presence => true
    validates :categories, :presence => true 
    validates_uniqueness_of :name, scope: :user_id, :case_sensitive => false
    validate :zero?

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
        s += item.item_cost.to_f
      end
    end

    def budget_over
      self.list_cost.to_f - self.budget.to_f
    end

    def budget_under
      self.budget.to_f - self.list_cost.to_f
    end

    def budget_result
      if self.list_cost.to_f > self.budget.to_f
        "You are $#{budget_over} over budget!"
      elsif self.list_cost.to_f < self.budget.to_f
        "You are $#{budget_under} under budget!"
      else
        "You are right on budget!"
      end
    end

    def zero?
      self.items.each do |item|
        if item.price.to_f < 0
            errors.add(:price, "can't be negative.")
        elsif item.price.to_f == 0
            errors.add(:price, "can't be zero.")
        end
      end
  end

end
