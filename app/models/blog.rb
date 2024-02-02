class Blog < ApplicationRecord

  include Visible
  belongs_to :topic, optional: true

  validates :title, presence: true

  has_many :materials, dependent: :destroy

  def to_param
    address
  end
end
