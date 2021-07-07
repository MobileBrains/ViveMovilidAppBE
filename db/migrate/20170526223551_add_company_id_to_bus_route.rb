class AddCompanyIdToBusRoute < ActiveRecord::Migration[5.0]
  def change
    add_column :bus_routes, :company_id, :integer
  end
end
