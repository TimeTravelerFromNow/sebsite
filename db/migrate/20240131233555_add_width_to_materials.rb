class AddWidthToMaterials < ActiveRecord::Migration[7.0]
  def change
    add_column :materials, :width, :integer
  end
end
