class AddUserIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :user_id, :integer, :default => 0
    add_index :events, :user_id
  end
end
