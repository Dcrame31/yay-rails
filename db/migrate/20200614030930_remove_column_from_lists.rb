class RemoveColumnFromLists < ActiveRecord::Migration[6.0]
  def change
    remove_column :lists, :user_id, :integer
  end
end
