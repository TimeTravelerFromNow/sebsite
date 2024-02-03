class CreateMaterialsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.string :content_type
      t.integer :position
      t.references :tutorial, null: true, foreign_key: true

      t.timestamps
    end
  end
end
