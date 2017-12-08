class Guest < ApplicationRecord
  belongs_to :registry

  validates :name, presence: true
end
