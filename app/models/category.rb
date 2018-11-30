class Category < ApplicationRecord
    has_many :jobs

    extend FriendlyId
    friendly_id :name_and_addon, use: [:slugged, :finders, :history]

    def name_and_addon
        if name =~ /(.+)-Jobs/i
            "#{name}"
        else
            "#{name}-jobs"
        end
    end

end