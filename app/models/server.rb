class Server < ApplicationRecord
  STATES = %i[ online offline ]
  SUPPORTED_VERSIONS = %w[ 2.0.23 ]

  validates :name, uniqueness: true

  def create_server_instance
    Cloud::Server.create(
      name: cloud_server_name,
      datacenter: "nbg1-dc3",
      server_type: "cpx11",
      image: "ubuntu-24.04",
      ssh_keys: ["Factorio Server Master"]
    )
  end

  def destroy_server_instance!
    Cloud::Server.destroy(id: cloud_server_id.to_i)
  end

  def cloud_server_name
    "server-#{id}"
  end
end
