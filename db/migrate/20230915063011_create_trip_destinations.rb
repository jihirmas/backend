class CreateTripDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :trip_destinations do |t|
      t.integer :trip_id
      t.integer :destination_id

      t.timestamps
    end
  end
end
