class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.integer :lateral_number
      t.string :registration_plate
      t.float :latitude
      t.float :longitude
      t.string :last_location

      t.timestamps
    end
  end
end
