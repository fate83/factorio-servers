class Server < ApplicationRecord
  STATES = %i[ online offline ]
  SUPPORTED_VERSIONS = %w[ 2.0.28 2.0.23 ]

  validates :name, uniqueness: true

  def cloud_server_name
    "server-#{id}"
  end
end
