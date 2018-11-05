class AddApplyDateToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :apply_date, :date
  end
end
