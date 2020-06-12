class AddColumnToGardens < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :name, :string
    add_column :gardens, :user_id, :integer
  end
end
