class Company < ApplicationRecord
    has_many :jobs

    extend FriendlyId
    friendly_id :slug_candidates, use: [:slugged, :history]
 
    def slug_candidates
     [
       :name,
       [:name, SecureRandom.hex(3)],
       [:name, SecureRandom.hex(3), SecureRandom.hex(3)]
     ]
   end
end