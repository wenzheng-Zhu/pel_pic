class CreateJiemuzuhe3s < ActiveRecord::Migration[5.2]
  def change
    create_table :jiemuzuhe3s do |t|
      t.string :video
      t.string :pic
      t.string :video_desc
      t.string :pic_desc
      t.integer :active

      t.timestamps
    end
  end
end
