class AddEventIdToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_column :invitations, :event_id, :integer
    add_index :invitations, :event_id
  end
end
