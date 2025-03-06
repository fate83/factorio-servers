class Server < ApplicationRecord
  STATES = %i[ online offline ]
  SUPPORTED_VERSIONS = %w[ 2.0.32 2.0.28 2.0.23 ]

  after_create_commit do |server|
    CreateServerJob.perform_later(server)
  end

  after_update_commit do |server|
    server.broadcast_update_later_to "servers", partial: "servers/server"
  end

  after_destroy_commit do |server|
    DestroyServerJob.perform_later(server.cloud_server_id.to_i, server.cloud_server_ip)
  end

  validates :name, uniqueness: true

  def cloud_server_name
    "server-#{id}"
  end

  def ip
    Cloud::Server.ip(id: cloud_server_id)
  end

  def download_link
    false unless Server::SUPPORTED_VERSIONS.include? version

    "https://www.factorio.com/get-download/#{version}/headless/linux64"
  end
end
