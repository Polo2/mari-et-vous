class Registry < ApplicationRecord
  belongs_to :wedding
  belongs_to :user
  has_many :guests

  accepts_nested_attributes_for :guests
  validates :email, presence: true
end
