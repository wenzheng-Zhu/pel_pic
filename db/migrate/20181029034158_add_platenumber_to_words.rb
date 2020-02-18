class AddPlatenumberToWords < ActiveRecord::Migration[5.2]
  def change
  	add_column :pragrams, :platenumber, :string
  end
end
