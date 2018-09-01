class CreateAssignedRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :assigned_routes do |t|
      t.integer :company_id
      t.integer :vehicle_id
      t.integer :bus_route_id
      t.integer :driver_id
      t.integer :assigned_by_id
      t.datetime :departure_time
      t.datetime :arrival_time

      t.timestamps
    end
  end
end
