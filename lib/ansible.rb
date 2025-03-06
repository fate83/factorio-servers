module Ansible
  def self.bootstrap!(host:)
    return unless host

    remote_user = "root"
    private_key = Rails.application.config.ansible[:private_key]
    playbook_path = Rails.root.join("lib", "ansible", "playbooks", "playbook_bootstrap.yml").to_s
    puts %Q(`ansible-playbook "#{playbook_path}" --private-key "#{private_key}" --inventory "#{host}," --limit "#{host}" --user "#{remote_user}" --extra-vars public_key=#{public_key}`)
    %x(`ansible-playbook "#{playbook_path}" --private-key "#{private_key}" --inventory "#{host}," --limit "#{host}" --user "#{remote_user}" --extra-vars public_key=#{public_key}`)
  end

  def self.install_headless_factorio!(host:, factorio_version:, factorio_download_link:)
    return unless host
    return unless factorio_download_link

    remote_user = "ansible"
    playbook_path = Rails.root.join("lib", "ansible", "playbooks", "playbook_factorio.yml").to_s
    puts %Q(`ansible-playbook "#{playbook_path}" --private-key "#{private_key}" --inventory "#{host}," --limit "#{host}" --user "#{remote_user}" --extra-vars public_key=#{public_key} --extra-vars factorio_download_link=#{factorio_download_link} --extra-vars factorio_version=#{factorio_version}`)
    %x(`ansible-playbook "#{playbook_path}" --private-key "#{private_key}" --inventory "#{host}," --limit "#{host}" --user "#{remote_user}" --extra-vars public_key=#{public_key} --extra-vars factorio_download_link=#{factorio_download_link} --extra-vars factorio_version=#{factorio_version}`)
  end

  private

  def self.private_key
    Rails.application.config.ansible[:private_key]
  end

  def self.public_key
    Rails.application.config.ansible[:public_key]
  end
end
