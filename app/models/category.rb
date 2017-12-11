class Category < ApplicationRecord
  belongs_to :task
  has_many :elements

  validates :name, presence: true
end
