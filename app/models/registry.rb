class Registry < ApplicationRecord
  belongs_to :wedding
  belongs_to :user

  serialize :guests, Array

end
