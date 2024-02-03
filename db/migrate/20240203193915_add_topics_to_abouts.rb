class AddTopicsToAbouts < ActiveRecord::Migration[7.0]
  def change
    add_reference :abouts, :topic, null: true, foreign_key: true
  end
end
