require "./event"

class Tempest::Listen < Tempest::Event
  TYPES = {
    "listen_start", "listen_stop", "listen_start_events", "listen_stop_events",
    "listen_rapid_start", "listen_rapid_stop", "ack",
  }

  def initialize(@type : String, @id : String, @device_id : Int64? = nil, @station_id : Int64? = nil)
    raise "bad type '#{@type}' must be one of #{TYPES}" unless @type.in?(TYPES)
  end

  property id : String

  def subscription_id
    @id
  end
end
