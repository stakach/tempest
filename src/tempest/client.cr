require "http"
require "../tempest"

class Tempest::Client
  def initialize(@access_token : String)
  end

  def locations : Array(Tempest::Location)
    response = HTTP::Client.get(
      "https://swd.weatherflow.com/swd/rest/stations?token=#{@access_token}",
      HTTP::Headers{
        "Accept" => "application/json",
      }
    )

    raise "failed to obtain list of locations" unless response.success?

    NamedTuple(stations: Array(Tempest::Location)).from_json(response.body)[:stations]
  end

  def websocket
    HTTP::WebSocket.new("wss://ws.weatherflow.com/swd/data?token=#{@access_token}")
  end
end
