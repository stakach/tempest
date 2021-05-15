# Weatherflow Tempest API

classes and basic helper methods for interacting with Tempest weather stations

## Usage

Doesn't implement any logic, just the basics to interact with the API - throw this in crystal play to see the payloads

```crystal
require "tempest"

client = Tempest::Client.new "40-edf7-40e0-b60a-0e"
locations = client.locations

websocket = client.websocket
websocket.on_message do |json|
  puts "=========="
  puts json
  puts "=========="
  event = Tempest::Event.from_json(json)
  case event
  when Tempest::Opened
  	listen = Tempest::Listen.new("listen_start", "Tempest", locs.first.devices.last.device_id).to_json
    websocket.send listen
  when Tempest::StationObs
  	pp! event.observations.first
	else
  	pp! event
	end
end

websocket.run
```
