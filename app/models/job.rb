class Job < ApplicationRecord
   belongs_to :company, optional: true

   accepts_nested_attributes_for :company
end