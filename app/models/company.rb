class Company < ApplicationRecord
    has_many :jobs
    has_one_attached :logo
    validates :name, :mail, presence: {message: "Darf nicht leer sein"}, on: :create 

    extend FriendlyId
    friendly_id :slug_candidates, use: [:slugged, :history]
    
    def slug_candidates
        [
        :name,
        [:name, SecureRandom.hex(3)],
        [:name, SecureRandom.hex(3), SecureRandom.hex(3)]
        ]
    end

    def logo_small
        return self.logo.variant(resize: "80x80")
    end

    def logo_medium
        return self.logo.variant(resize: "150x150")
    end
end