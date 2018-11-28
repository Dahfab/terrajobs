class AddHighlightToJobs < ActiveRecord::Migration[5.2]
    def change
        add_column :jobs, :highlight, :boolean, default: false
    end
end
