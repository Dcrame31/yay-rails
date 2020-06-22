class AddTimestampsToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :created_at, :datetime
    add_column :lists, :updated_at, :datetime
  end
end
