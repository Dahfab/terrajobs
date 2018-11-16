class Category < ApplicationRecord
    has_many :job

    extend FriendlyId
    friendly_id :name_and_addon, use: :slugged

    def name_and_addon
        if name == "Green-Jobs"
            "#{name}"
        else
            "#{name}-jobs"
        end
    end

end