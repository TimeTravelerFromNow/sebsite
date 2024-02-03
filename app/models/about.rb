class About < ApplicationRecord
  has_rich_text :body

  has_one_attached :portrait

  belongs_to :topic, optional: true
end
