class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :event
      t.integer :date
      t.text :location
      t.text :invite

      t.timestamps
    end
  end
end
