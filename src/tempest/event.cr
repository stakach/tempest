require "json"
require "../tempest"

abstract class Tempest::Event
  include JSON::Serializable

  use_json_discriminator "type", {
    connection_opened:   Opened,
    listen_start:        Listen,
    listen_stop:         Listen,
    listen_start_events: Listen,
    listen_stop_events:  Listen,
    listen_rapid_start:  Listen,
    listen_rapid_stop:   Listen,
    ack:                 Listen,
    evt_precip:          Raining,
    evt_strike:          Lightning,
    evt_device_online:   DeviceOnline,
    evt_device_offline:  DeviceOffline,
    evt_station_online:  StationOnline,
    evt_station_offline: StationOffline,
    rapid_wind:          Wind,
    obs_air:             AirObs,
    obs_sky:             SkyObs,
    obs_st:              StationObs,
  }

  property type : String
  property device_id : Int64?
  property station_id : Int64?

  def device_id
    (@device_id || @station_id).not_nil!
  end
end

class Tempest::Opened < Tempest::Event
end
