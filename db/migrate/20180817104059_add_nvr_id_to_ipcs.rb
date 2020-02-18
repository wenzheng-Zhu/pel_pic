class AddNvrIdToIpcs < ActiveRecord::Migration[5.2]
  def change
  	add_column :ipcs, :nvr_id, :integer
  end
end
