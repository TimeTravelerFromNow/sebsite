class AddLangToMaterials < ActiveRecord::Migration[7.0]
  def change
    add_column :materials, :lang, :string
  end
end
