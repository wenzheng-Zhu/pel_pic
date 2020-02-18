class AddItemIdToWords < ActiveRecord::Migration[5.2]
  def change
  	add_column :words, :item_id, :integer
  end
end
