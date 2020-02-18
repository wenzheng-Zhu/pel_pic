class CreateProfaces < ActiveRecord::Migration[5.2]
  def change
    create_table :profaces do |t|
      t.string :name
      t.string :pro_ip
      t.string :pro_port

      t.timestamps
    end
  end
end
