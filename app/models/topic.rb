class Topic < ApplicationRecord

  def to_param
    title
  end
end
