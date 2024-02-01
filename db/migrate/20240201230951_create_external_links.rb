class CreateExternalLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :external_links do |t|
      t.string :address
      t.string :icon
      t.references :blog, null: true, foreign_key: true
      t.references :topic, null: true, foreign_key: true
      t.references :tutorial, null: true, foreign_key: true

      t.timestamps
    end
  end
end
