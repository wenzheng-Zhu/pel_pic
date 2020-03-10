class AddRtspToPelcos < ActiveRecord::Migration[5.2]
  def change
    add_column :pelcos, :rtsp, :string
  end
end
