class AddSlugToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :slug, :string
  end
end
