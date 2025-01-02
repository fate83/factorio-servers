require "hcloud"

module Cloud
  module Server
    def self.client
      @@client ||= Hcloud::Client.new(token: Rails.application.config.hetzner.hcloud[:api_token])
    end

    def self.create(name:, datacenter:, server_type:, image:, ssh_keys:)
      client.servers.create(name:, datacenter:, server_type:, image:, ssh_keys:)
    end

    def self.update(id:)
      client.servers.find(id:).update(name: name)
    end

    def self.destroy(id:)
      client.servers.find(id.to_i).destroy
    end

    def self.ip(id:)
      client.servers.find(id.to_i).public_net["ipv4"].ip
    end
  end
end
