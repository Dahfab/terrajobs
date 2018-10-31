class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
        t.string :name
        t.string :mail
        t.string :facebook_url
        t.string :twitter_url
        t.decimal :company_lat, precision: 10, scale: 6
        t.decimal :company_long, precision: 10, scale: 6

        t.references :jobs
        t.timestamps
    end
  end
end
