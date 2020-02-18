class CreateIpcs < ActiveRecord::Migration[5.2]
  def change
    create_table :ipcs do |t|
      t.string :name
      t.string :path_no
      t.string :canshu
      t.string :string

      t.timestamps
    end
  end
end
