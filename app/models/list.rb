class List < ApplicationRecord
    has_many :lists_categories
    has_many :categories, through: :lists_categories,
              dependent: :nullify
    has_many :items,
              dependent: :nullify
    validates :name, :presence => true
    validates :budget, :presence => true
    validates :categories, :presence => true 
    validates_uniqueness_of :name, scope: :user_id, :case_sensitive => false
    validate :price_zero?

    scope :most_recent_list, -> {order(:created_at).last}
    scope :highest_budget, -> { where(budget: self.maximum(:budget))}

    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
          if category_attribute[:name].present?
            category = User.current.categories.create(category_attribute)
            self.categories << category
          end
        end
    end

    def items_attributes=(item_attributes)
        item_attributes.values.each do |item_attribute|
          if item_attribute[:name].present?
            item = Item.create(item_attribute)
            self.items << item
          end
        end
    end

    def list_cost
      self.items.reduce(0){|s, item| s += item.item_cost.to_f }.round(2)
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

    def price_zero?
      self.items.each do |item|
        if item.price.to_f < 0
            errors.add(:price, "can't be negative.")
        elsif item.price.to_f == 0
            errors.add(:price, "can't be zero.")
        end
      end
    end

end
