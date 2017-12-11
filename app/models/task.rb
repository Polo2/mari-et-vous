require 'json'

class Task < ApplicationRecord
  NAMES = %w(
    music
    food
  )

  belongs_to :wedding
  has_many :categories
  has_many :messages

  after_create :create_default_categories

  private

  def create_default_categories
    file = File.read("#{Rails.root}/lib/tasks_details/details.json")
    categories_details = JSON.parse(file)

    categories_details[name].each do |category|
      Category.create(task: self, name: category)
    end
  end
end
