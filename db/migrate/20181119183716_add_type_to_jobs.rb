class AddTypeToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :type, foreign_key: true
  end
end
