class AddSortToPragrams < ActiveRecord::Migration[5.2]
  def change

  	add_column :pragrams, :sort, :string
  end
end
