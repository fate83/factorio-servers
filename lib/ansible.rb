module Ansible
  def self.bootstrap!(host)
    remote_user = 'root'
    private_key = Rails.application.config.ansible[:private_key]
    private_key_password = Rails.application.credentials[:ansible_key_password]
    playbook_path = Rails.root.join('lib', 'ansible', 'playbooks', 'playbook_bootstrap.yml').to_s
    puts `ansible-playbook "#{playbook_path}" --private-key "#{private_key}" --inventory "#{host}," --limit "#{host}" --user "#{remote_user}"`

  end

  def self.install_factorio

  end
end