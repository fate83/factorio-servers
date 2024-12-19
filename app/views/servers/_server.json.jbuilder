json.extract! server, :id, :title, :version, :state, :created_at, :updated_at
json.url server_url(server, format: :json)
