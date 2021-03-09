class AddCreatorIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :creator_id, :integer, default => 0
    add_index :events, :creator_id
  end
end
