class AddPanelIdToIpcs < ActiveRecord::Migration[5.2]
  def change
  	add_column :ipcs, :panel_id, :integer
  end
end
