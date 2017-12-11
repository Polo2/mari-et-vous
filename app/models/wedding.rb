class Wedding < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :registries, dependent: :destroy
  has_many :guests, through: :registries, source: :user
  # has_many :messages, through: :tasks
  # has_many :reviews, dependent: :destroy
  has_attachment :photo
  has_attachment :spouse_photo

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

end
