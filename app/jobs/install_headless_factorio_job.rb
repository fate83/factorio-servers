class InstallHeadlessFactorioJob < ApplicationJob
  queue_as :default

  def perform(server)
    server.update!(state: :installing)
    Ansible.install_headless_factorio!(host: server.cloud_server_ip, factorio_version: server.version, factorio_download_link: server.download_link)
    server.update!(state: :ready)
  end
end
