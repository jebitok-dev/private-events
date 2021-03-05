class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :event_name
      t.text :description
      t.string :date
      t.string :location

      t.timestamps
    end
  end
end