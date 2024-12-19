json.extract! server, :id, :name, :version, :state, :cloud_server_id, :created_at, :updated_at
json.url server_url(server, format: :json)
