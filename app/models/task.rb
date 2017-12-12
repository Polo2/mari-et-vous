require 'json'

class Task < ApplicationRecord


  belongs_to :wedding
  has_many :elements, dependent: :destroy
  has_many :messages


  after_create :create_default_categories

  private

  def create_default_categories
    file = File.read("#{Rails.root}/lib/tasks_details/details.json")
    defaults_elements = JSON.parse(file)

    defaults_elements[name].each do |text|
      Element.create(task: self, content: text, public: false)
    end
  end
end
