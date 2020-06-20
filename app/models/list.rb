class List < ApplicationRecord
    has_many :lists_categories
    has_many :categories, through: :lists_categories
    has_many :items
    validates :name, :presence => true
    validates :budget, :presence => true
    validates :categories, :presence => true 
    
    # validates_uniqueness_of :name, :case_sensitive => false
    

    
    def list_unique?
      if current_user.lists.include?(:name)
        errors.add(:name, "List already exists")
      end
    end

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


end
