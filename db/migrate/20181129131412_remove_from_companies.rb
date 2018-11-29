class RemoveFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :company_lat
    remove_column :companies, :company_long
    add_column :companies, :latitude, :float
    add_column :companies, :longitude, :float
    add_column :companies, :address, :string
  end
end
