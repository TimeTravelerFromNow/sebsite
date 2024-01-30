class AddStatusToTopics < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :status, :string
  end
end
