class AddStatusToTutorials < ActiveRecord::Migration[7.0]
  def change
    add_column :tutorials, :status, :string
  end
end
