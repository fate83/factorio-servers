class DestroyServerJob < ApplicationJob
  queue_as :default

  def perform(cloud_server_id)
    Cloud::Server.destroy(id: cloud_server_id)
  end
end
