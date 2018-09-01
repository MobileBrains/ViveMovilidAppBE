class AddManagerIdToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :manager_id, :integer
  end
end
