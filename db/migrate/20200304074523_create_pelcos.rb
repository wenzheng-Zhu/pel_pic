class CreatePelcos < ActiveRecord::Migration[5.2]
  def change
    create_table :pelcos do |t|
      t.string :ip
      t.string :camera_name

      t.timestamps
    end
  end
end
