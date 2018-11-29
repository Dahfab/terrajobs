class RemoveLonglatFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :longitude
    remove_column :companies, :latitude
  end
end
