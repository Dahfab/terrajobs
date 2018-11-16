class Category < ApplicationRecord
    has_many :job

    extend FriendlyId
    friendly_id :name_attr, use: :slugged

    def name_attr
        if name == "Green-Jobs"
            "#{name}"
        else
            "#{name} jobs"
        end
    end

end