class Category < ApplicationRecord
    has_many :jobs

    extend FriendlyId
    friendly_id :name, use: :slugged
end