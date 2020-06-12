class AddColumnsToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :name, :string
    add_column :plants, :species, :string
    add_column :plants, :genus, :string
    add_column :plants, :family, :string
    add_column :plants, :garden_id, :integer
    add_column :plants, :category, :id
    add_column :plants, :integer, :string
  end
end
