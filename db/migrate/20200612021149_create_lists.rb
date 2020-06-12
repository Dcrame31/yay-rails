class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :user_id
      t.string :description
      t.float :budget
    end
  end
end
