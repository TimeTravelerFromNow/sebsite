class AddKeyToExternalLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :external_links, :key, :string
  end
end
