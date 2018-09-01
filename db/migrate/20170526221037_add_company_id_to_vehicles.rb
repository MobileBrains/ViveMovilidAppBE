class AddCompanyIdToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :company_id, :integer
  end
end
