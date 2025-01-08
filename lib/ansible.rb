module Ansible
  def self.bootstrap!(host)
    remote_user = 'root'
    private_key = Rails.application.config.ansible[:private_key]
    playbook_path = Rails.root.join('lib', 'ansible', 'playbooks', 'playbook_bootstrap.yml').to_s
    %x(`ansible-playbook "#{playbook_path}" --private-key "#{private_key}" --inventory "#{host}," --limit "#{host}" --user "#{remote_user}" --extra-vars public_key=#{public_key}`)
  end

  def self.install_factorio!(host)
    remote_user = 'ansible'
    playbook_path = Rails.root.join('lib', 'ansible', 'playbooks', 'playbook_factorio.yml').to_s
    %x(`ansible-playbook "#{playbook_path}" --private-key "#{private_key}" --inventory "#{host}," --limit "#{host}" --user "#{remote_user}" --extra-vars public_key=#{public_key}`)
  end

  private

  def self.private_key
    Rails.application.config.ansible[:private_key]
  end

  def self.public_key
    Rails.application.config.ansible[:public_key]
  end
end