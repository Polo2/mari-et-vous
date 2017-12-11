class Registry < ApplicationRecord
  belongs_to :wedding
  belongs_to :user
  has_many :guests

  accepts_nested_attributes_for :guests
  validates :email, presence: true

  before_create :set_user_id

  private

  def set_user_id
    user = User.find_by_email(email.downcase)

    if user.present?
      self.user_id = user.id
    end
  end
end
