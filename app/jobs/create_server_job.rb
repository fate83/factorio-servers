class CreateServerJob < ApplicationJob
  queue_as :default

  def perform(server)
    _action, server_instance = Cloud::Server.create(
      name: server.cloud_server_name,
      datacenter: "nbg1-dc3",
      server_type: "cpx11",
      image: "ubuntu-24.04",
      ssh_keys: ["Factorio Server Master"]
    )

    if server_instance
      server.update!(cloud_server_id: server_instance.id, cloud_server_ip: server_instance.public_net["ipv4"].ip, state: :bootstrapping)
      Ansible.bootstrap!(server.cloud_server_ip)
      server.update!(state: :bootstrapped)
    else
      raise "Cloud Server could not be created: #{server.name} (#{server.id})"
    end
  rescue => e
    Rails.logger.error e.message, e.backtrace
  end
end
