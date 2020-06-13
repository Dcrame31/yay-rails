class RemoveColumnFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :google_token, :string
    remove_column :users, :google_refresh, :string
    remove_column :users, :google_refresh_token, :string
  end
end
