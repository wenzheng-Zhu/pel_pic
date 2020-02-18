class AddParkingLotNoToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :parking_lot_no, :integer
  end
end
