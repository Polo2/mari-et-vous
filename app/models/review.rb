class Review < ApplicationRecord
  belongs_to :wedding

  has_attachments :photos, maximum: 30
end
