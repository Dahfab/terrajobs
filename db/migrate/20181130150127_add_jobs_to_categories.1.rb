class AddJobsToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :job
  end
end
