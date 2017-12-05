class Task < ApplicationRecord
  belongs_to :wedding
  has_many :messages

end
