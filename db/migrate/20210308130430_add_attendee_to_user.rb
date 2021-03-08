class AddAttendeeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :attendee, foreign_key: true
  end
end
