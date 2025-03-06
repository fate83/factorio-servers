# - Creates Server instance in Hetzner Cloud
# - Adds instance to known hosts file
# - Runs Boostrap Playbook
class CreateServerJob < ApplicationJob
  queue_as :default

  def perform(server)
    Rails.logger.info "Creating new server instance for server: #{server.name}"
    _action, server_instance = Cloud::Server.create(
      name: server.cloud_server_name,
      datacenter: "nbg1-dc3",
      server_type: "cpx11",
      image: "ubuntu-24.04",
      ssh_keys: ["FactorioServerMasterKey"]
    )
    server_ip = server_instance.public_net["ipv4"].ip

    while server_instance.status != "running"
      sleep(1)
      server_instance = Cloud::Server.client.servers.find(server_instance.id)
    end
    sleep(5)

    server.update!(cloud_server_id: server_instance.id, cloud_server_ip: server_ip)

    Rails.logger.info "Running keyscan"
    until system "ssh-keyscan -T 240 #{server_ip} >> ~/.ssh/known_hosts"
      Rails.logger.info "Waiting for keyscan #{server_ip}, #{server_instance}"
      sleep(1)
    end

    server.update!(state: :bootstrapping)
    Ansible.bootstrap!(host: server.cloud_server_ip)
    server.update!(state: :bootstrapped)
    Ansible.install_headless_factorio! host: server.cloud_server_ip, factorio_version: server.version, factorio_download_link: server.download_link
    server.update!(state: :ready)
  rescue => e
    Rails.logger.error "#{e.message}, #{e.backtrace}"
  end
end
