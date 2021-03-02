class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event
      t.string :date
      t.text :location
      t.string :invite

      t.timestamps
    end
  end
end
