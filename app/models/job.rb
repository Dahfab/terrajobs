class Job < ApplicationRecord
   belongs_to :company, optional: true

   extend FriendlyId
   friendly_id :position, use: :slugged

   accepts_nested_attributes_for :company
end