class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :lateral
      t.string :registration_plate
      t.float :latitude, :default => 5.0730109
      t.float :longitude, :default => -75.5314799
      t.string :last_location

      t.timestamps
    end
  end
end
