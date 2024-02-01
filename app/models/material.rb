class Material < ApplicationRecord
  belongs_to :tutorial, :optional => true
  belongs_to :blog, :optional => true

  has_rich_text :content
  
  has_rich_text :code_content

  has_one_attached :image

  validates :content_type, inclusion: { in: ['RICH_TEXT', 'IMAGE', 'CODE_BLOCK']}

  def rich_text?
    content_type == 'RICH_TEXT'
  end

  def image?
    content_type == 'IMAGE'
  end

  def code_block?
    content_type == 'CODE_BLOCK'
  end

end
