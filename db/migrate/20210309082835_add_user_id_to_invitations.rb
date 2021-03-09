class AddUserIdToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_column :invitations, :user_id, :integer
    add_index :invitations, :user_id
  end
end
