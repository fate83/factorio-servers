private_key = Rails.application.config.ansible[:private_key]
public_key = Rails.application.config.ansible[:public_key]

raise unless File.exist?(File.expand_path(private_key))
raise unless File.exist?(File.expand_path(public_key))
