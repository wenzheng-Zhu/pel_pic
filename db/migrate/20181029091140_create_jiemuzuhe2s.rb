class CreateJiemuzuhe2s < ActiveRecord::Migration[5.2]
  def change
    create_table :jiemuzuhe2s do |t|
      t.string :video
      t.string :duration

      t.timestamps
    end
  end
end
