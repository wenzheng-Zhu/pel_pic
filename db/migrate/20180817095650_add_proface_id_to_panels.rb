class AddProfaceIdToPanels < ActiveRecord::Migration[5.2]
  def change
  	add_column :panels, :proface_id, :integer
  end
end
