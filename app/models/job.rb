class Job < ApplicationRecord
   belongs_to :company, optional: true, touch: true
   belongs_to :category
   belongs_to :type
   delegate :name, to: :type, prefix: true
   validates :position, :description, :address, presence: {message: "Darf nicht leer sein"}, on: :create 
   geocoded_by :address
   before_validation :full_url
   after_validation :geocode

   extend FriendlyId
   friendly_id :slug_candidates, use: [:slugged, :finders, :history]

   def full_url
    if self.apply_url.present?
        unless self.apply_url[/^http?:\/\//] || self.apply_url[/^https?:\/\//]
            self.apply_url = "http://#{self.apply_url}"
        end
    end
  end

   def slug_candidates
    [
      :position,
      [:position, SecureRandom.hex(3)],
      [:position, SecureRandom.hex(3), SecureRandom.hex(3)]
    ]
   end

   accepts_nested_attributes_for :company
end