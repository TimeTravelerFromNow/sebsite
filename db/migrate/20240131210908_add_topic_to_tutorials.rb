class AddTopicToTutorials < ActiveRecord::Migration[7.0]
  def change
    add_reference :tutorials, :topic, null: true, foreign_key: true
  end
end
