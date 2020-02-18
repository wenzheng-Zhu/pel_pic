class CreatePics < ActiveRecord::Migration[5.2]
  def change
    create_table :pics do |t|
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
