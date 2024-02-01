class AddAddressToTutorials < ActiveRecord::Migration[7.0]
  def change
    add_column :tutorials, :address, :string
  end
end
