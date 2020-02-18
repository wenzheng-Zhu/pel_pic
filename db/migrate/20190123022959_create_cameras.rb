class CreateCameras < ActiveRecord::Migration[5.2]
  def change
    create_table :cameras do |t|
      t.string :ip_adress
      t.string :name

      t.timestamps
    end
  end
end
