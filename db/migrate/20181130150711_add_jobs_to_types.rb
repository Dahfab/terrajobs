class AddJobsToTypes < ActiveRecord::Migration[5.2]
  def change
    add_reference :types, :job
  end
end
