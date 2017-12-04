class Wedding < ApplicationRecord
  belongs_to :users

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

end
