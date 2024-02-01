class CreateTutorials < ActiveRecord::Migration[7.0]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :description
      t.boolean :featured
      t.string :icon

      t.timestamps
    end
  end
end
