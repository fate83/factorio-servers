class Server < ApplicationRecord
  STATES = %i[ online offline ]
  SUPPORTED_VERSIONS = %w[ 2.0.23 ]
end
