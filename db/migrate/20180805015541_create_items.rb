class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.integer :duration

      t.timestamps
    end
  end
end
