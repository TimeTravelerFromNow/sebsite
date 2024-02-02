class Tutorial < ApplicationRecord
  belongs_to :topic, optional: true

  validates :title, presence: true
  validates :address, presence: true
  validates_uniqueness_of :title
  validates_uniqueness_of :address

  validates :description, presence: true, length: {minimum: 2}

  include Visible

  has_many :materials, dependent: :destroy


  def featured?
    featured
  end

  def to_param
    address
  end
end
