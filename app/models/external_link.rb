class ExternalLink < ApplicationRecord
  belongs_to :topic, :optional => true
  belongs_to :tutorial, :optional => true

  has_one_attached :custom_icon
  
  validates :key, presence: true

  include Links
end
