class Topic < ApplicationRecord

  include Visible

  has_one_attached :header_image

  has_rich_text :explanation

  has_many :tutorials, dependent: :nullify

  has_many :external_links, dependent: :destroy

  has_one :about, dependent: :nullify

  validates :title, presence: true, exclusion: { in: ['tutorials', 'materials', 'blogs', 'abouts', 'external_links'] }

  def to_param
    title
  end

  validates_uniqueness_of :title

end
