class Tutorial < ApplicationRecord

  validates :title, presence: true
  validates :address, presence: true

  validates :description, presence: true, length: {minimum: 2}

  belongs_to :topic, optional: true
  include Visible

  has_many :materials, dependent: :destroy


  def featured?
    featured
  end
  
  def to_param
    address
  end
end
