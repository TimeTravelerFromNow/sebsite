class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :description
      t.integer :position
      t.integer :nav_pos
      t.string :icon

      t.timestamps
    end
  end
end
