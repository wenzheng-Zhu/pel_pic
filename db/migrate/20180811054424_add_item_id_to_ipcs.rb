class AddItemIdToIpcs < ActiveRecord::Migration[5.2]
  def change
  	add_column :ipcs, :item_id, :integer
  end
end
