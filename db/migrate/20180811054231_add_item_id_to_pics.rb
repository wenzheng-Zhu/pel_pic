class AddItemIdToPics < ActiveRecord::Migration[5.2]
  def change
  	add_column :pics, :item_id, :integer
  end
end
