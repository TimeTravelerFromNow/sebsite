class AddIsBlogToTutorials < ActiveRecord::Migration[7.0]
  def change
    add_column :tutorials, :is_blog, :boolean
  end
end
