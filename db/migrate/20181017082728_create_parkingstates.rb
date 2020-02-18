class CreateParkingstates < ActiveRecord::Migration[5.2]
  def change
    create_table :parkingstates do |t|
      t.string :device_description
      t.integer :suv_amount
      t.integer :suv_available
      t.integer :car_amount
      t.integer :car_available
      t.string :carboard_description
      t.string :platenumber

      t.timestamps
    end
  end
end
