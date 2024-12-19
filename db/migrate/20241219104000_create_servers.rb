class CreateServers < ActiveRecord::Migration[8.0]
  def change
    create_table :servers do |t|
      t.string :title, default: 'Factorio Server'
      t.string :version, default: '2.0.23'
      t.string :state, default: 'offline'

      t.timestamps
    end
  end
end
