class Category < ApplicationRecord
    has_many :job

    extend FriendlyId
    friendly_id :name_and_addon, use: [:slugged, :finders]

    def name_and_addon
        if name == "Green-Jobs"
            "#{name}"
        elsif name == "Vermessung"
            "#{name}s-jobs"
        else
            "#{name}-jobs"
        end
    end

end