class Element < ApplicationController
  belongs_to :task

  validates :public, presence: true

end
