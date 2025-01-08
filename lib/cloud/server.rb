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
      server = client.servers.find(id.to_i)
      server.update(name: name) if server
    rescue Hcloud::Error::NotFound
      Rails.logger.error("Server not found: #{id}")
    end

    def self.destroy(id:)
      server = client.servers.find(id.to_i)
      server.destroy if server
    rescue Hcloud::Error::NotFound
      Rails.logger.error("Server not found: #{id}")
    end

    def self.ip(id:)
      client.servers.find(id.to_i).public_net["ipv4"].ip
    end
  end
end
