class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.datetime :orig_date
      t.string :status
      t.boolean :featured

      t.timestamps
    end
  end
end
