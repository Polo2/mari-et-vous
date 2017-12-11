class Element < ApplicationRecord
  belongs_to :task

  validates :public, inclusion: [true, false]

end
