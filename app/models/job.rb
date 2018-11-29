class Job < ApplicationRecord
   belongs_to :company, optional: true
   has_one :category
   has_one :type
   geocoded_by :address
   after_validation :geocode

   extend FriendlyId
   friendly_id :slug_candidates, use: :slugged

   def slug_candidates
    [
      :position,
      [:position, SecureRandom.hex(3)],
      [:position, SecureRandom.hex(3), SecureRandom.hex(3)]
    ]
   end

   accepts_nested_attributes_for :company
end