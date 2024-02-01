class Topic < ApplicationRecord

  include Visible

  has_one_attached :header_image

  has_rich_text :explanation

  has_many :tutorials

  has_many :external_links

  validates :title, exclusion: { in: ['tutorials', 'materials', 'blogs', 'abouts'] }

  def to_param
    title
  end
end
