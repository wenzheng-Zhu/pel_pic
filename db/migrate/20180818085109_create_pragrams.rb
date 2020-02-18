class CreatePragrams < ActiveRecord::Migration[5.2]
  def change
    create_table :pragrams do |t|
      t.string :name
      t.string :url
      t.string :attachment
      t.integer :item_id
      t.string :type
      t.string :duration
      t.text :content

      t.timestamps
    end
  end
end
