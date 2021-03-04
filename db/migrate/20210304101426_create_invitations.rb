class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.text :attendee

      t.timestamps
    end
  end
end
