class Company < ApplicationRecord
    has_many :jobs
    has_one_attached :logo
    validates :name, :email, presence: true
    validates :name, uniqueness: true

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
        return self.logo.variant(resize: "100x100")
    end
end