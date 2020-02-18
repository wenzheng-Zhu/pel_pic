class AddScreenDescToParkingstates < ActiveRecord::Migration[5.2]
  def change
    add_column :parkingstates, :screen_desc, :string
  end
end
