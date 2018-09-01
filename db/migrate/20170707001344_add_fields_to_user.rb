class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :document, :integer
    add_column :users, :phone, :integer
    add_column :users, :birthdate, :date
    add_column :users, :neighborhood, :string
  end
end
