class AddProfaceIdToIpcs < ActiveRecord::Migration[5.2]
  def change

  	add_column :ipcs, :proface_id, :integer
  end
end
