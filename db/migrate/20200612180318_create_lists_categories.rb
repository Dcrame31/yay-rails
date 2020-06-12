class CreateListsCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :lists_categories do |t|
      t.integer :list_id
      t.integer :category_id
    end
  end
end
