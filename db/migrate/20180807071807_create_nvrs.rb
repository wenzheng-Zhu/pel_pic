class CreateNvrs < ActiveRecord::Migration[5.2]
  def change
    create_table :nvrs do |t|
      t.string :name
      t.string :nvr_user
      t.string :password
      t.string :nvr_ip
      t.string :nvr_port

      t.timestamps
    end
  end
end
