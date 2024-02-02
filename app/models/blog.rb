class Blog < ApplicationRecord

  include Visible
  belongs_to :topic, optional: true

  validates :title, presence: true

  validates_uniqueness_of :title
  validates_uniqueness_of :address

  has_many :materials, dependent: :destroy

  def to_param
    address
  end
end
