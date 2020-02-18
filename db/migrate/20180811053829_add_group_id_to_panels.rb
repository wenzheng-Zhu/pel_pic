class AddGroupIdToPanels < ActiveRecord::Migration[5.2]
  def change
  	add_column :panels, :group_id, :integer
  end
end
