class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event
      t.string :date
      t.text :location
      t.string :invite
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
