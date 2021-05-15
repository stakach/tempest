require "./event"

class Tempest::AirObs < Tempest::Event
  property obs : Array(Tuple(Int64, Float64, Float64, Int32, Int32, Int32, Float64, Int32))

  def observations
    obs.map { |observation| Tempest::Air.new(*observation) }
  end
end

class Tempest::Air
  def initialize(
    time : Int64,
    @millibar_pressure,
    @celsius_temperature,
    @percentage_humidity,
    @lightening_strikes,
    @lightening_strike_kilometers,
    @battery_volts,
    interval : Int32
  )
    @time = Time.unix(time)
    @report_interval = interval.minutes
  end

  getter time : Time
  getter millibar_pressure : Float64
  getter celsius_temperature : Float64
  getter percentage_humidity : Int32
  getter lightening_strikes : Int32
  getter lightening_strike_kilometers : Int32
  getter battery_volts : Float64
  getter report_interval : Time::Span
end
