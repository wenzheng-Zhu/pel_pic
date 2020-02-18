class CreateJiemuzuhe1s < ActiveRecord::Migration[5.2]
  def change
    create_table :jiemuzuhe1s do |t|
      t.string :video1
      t.string :video2
      t.string :desc
      t.integer :command_type

      t.timestamps
    end
  end
end
