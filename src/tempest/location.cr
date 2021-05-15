require "../tempest"

class Tempest::Location
  include JSON::Serializable

  property station_id : Int64
  property name : String
  property public_name : String

  property latitude : Float64
  property longitude : Float64

  property devices : Array(Device)
end

class Tempest::Device
  include JSON::Serializable

  property device_id : Int64
  property serial_number : String?
  property device_meta : DeviceMeta

  delegate name, to: @device_meta
  delegate environment, to: @device_meta
  delegate wifi_network_name, to: @device_meta

  def active?
    !@serial_number.nil?
  end
end

class Tempest::DeviceMeta
  include JSON::Serializable

  property name : String
  property environment : String
  property wifi_network_name : String
end
