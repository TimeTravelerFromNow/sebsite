class Blog < ApplicationRecord

  include Visible
  belongs_to :topic

  has_many :materials, dependent: :destroy
end
