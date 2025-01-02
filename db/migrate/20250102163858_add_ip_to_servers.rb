class AddIpToServers < ActiveRecord::Migration[8.0]
  def change
    add_column :servers, :cloud_server_ip, :string
  end
end
