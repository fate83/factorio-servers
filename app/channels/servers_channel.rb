class ServersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "servers"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
