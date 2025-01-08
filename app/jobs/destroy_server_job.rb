class DestroyServerJob < ApplicationJob
  queue_as :default

  def perform(cloud_server_id, server_ip)
    Rails.logger.info "Destroying server at #{cloud_server_id}"
    system "ssh-keygen -R #{server_ip}"
    Cloud::Server.destroy(id: cloud_server_id)
  end
end
