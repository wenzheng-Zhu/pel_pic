class AddUsedToItems < ActiveRecord::Migration[5.2]
  def change
  	add_column :items, :used, :boolean
  end
end
