class AddPanelIdToItems < ActiveRecord::Migration[5.2]
  def change
  	add_column :items, :panel_id, :integer
  end
end
