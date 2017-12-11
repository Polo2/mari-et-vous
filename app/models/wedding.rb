class Wedding < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :registries, dependent: :destroy
  has_many :guests, through: :registries
  # has_many :messages, through: :tasks
  # has_many :reviews, dependent: :destroy
  has_attachment :photo
  has_attachment :spouse_photo
  has_attachments :album_photos, maximun: 30

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def passed?(wedding)
    @wedding = wedding
    if @wedding.date < Date.current
      return true
    else
      return false
    end
  end
end
