class AddUserIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :user, creator, foreign_key: true
  end
end
