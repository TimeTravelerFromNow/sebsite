class ExternalLink < ApplicationRecord
  belongs_to :blog, :optional => true
  belongs_to :topic, :optional => true
  belongs_to :tutorial, :optional => true
end
