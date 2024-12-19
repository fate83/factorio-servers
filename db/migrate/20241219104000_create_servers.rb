class CreateServers < ActiveRecord::Migration[8.0]
  def change
    create_table :servers do |t|
      t.string :name, default: 'Factorio Server'
      t.string :version, default: '2.0.23'
      t.string :state, default: 'offline'
      t.string :cloud_server_id, default: nil, null: true

      t.timestamps

      t.index(:name, unique: true)
    end
  end
end
