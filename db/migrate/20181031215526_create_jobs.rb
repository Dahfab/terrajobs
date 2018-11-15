class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
        t.string :position
        t.text :description
        t.text :responsibilities
        t.text :requirements
        t.text :offers
        t.text :how_to_apply
        t.string :apply_url
        t.string :apply_mail
        
        t.references :company
        t.timestamps
    end
  end
end
