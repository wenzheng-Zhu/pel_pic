class AddNameToPelcos < ActiveRecord::Migration[5.2]
  def change
    add_column :pelcos, :name, :string
  end
end
