require "./event"

class Tempest::StationObs < Tempest::Event
  property obs : Array(Tuple(Int64, Float64, Float64, Float64, Int32, Int32, Float64, Float64, Int32, Int32, Float64, Int32, Float64, Int32, Int32, Int32, Float64, Int32, Float64, Float64?, Float64?, Int32))

  def observations
    obs.map { |observation| Tempest::Station.new(*observation) }
  end
end

class Tempest::Station
  def initialize(
    time : Int64,
    @wind_lull,
    @wind_average,
    @wind_gust,
    @wind_direction,
    wind_sample_interval,

    @millibar_pressure,
    @celsius_temperature,
    @percentage_humidity,

    @lux,
    @uv_index,

    @solar_radiation,
    @mm_rain_accumulation,
    precipitation_type,
    @lightening_strike_kilometers,
    @lightening_strikes,

    @battery_volts,
    report_interval,

    @mm_rain_accumulation_daily,
    @mm_rain_accumulation_final,
    @mm_rain_accumulation_daily_final,
    precipitation_analysis
  )
    @time = Time.unix(time)
    @wind_sample_interval = wind_sample_interval.minutes
    @report_interval = report_interval.minutes
    @precipitation_type = PrecipitationType.from_value precipitation_type
    @report_interval = report_interval.minutes
    @precipitation_analysis = PrecipitationAnalysis.from_value precipitation_analysis
  end

  getter time : Time
  getter wind_lull : Float64
  getter wind_average : Float64
  getter wind_gust : Float64
  getter wind_direction : Int32
  getter wind_sample_interval : Time::Span

  getter millibar_pressure : Float64
  getter celsius_temperature : Float64
  getter percentage_humidity : Int32

  getter lux : Int32
  getter uv_index : Float64
  getter solar_radiation : Int32
  getter mm_rain_accumulation : Float64

  @[JSON::Field(converter: Enum::ValueConverter(PrecipitationType))]
  getter precipitation_type : PrecipitationType

  getter lightening_strikes : Int32
  getter lightening_strike_kilometers : Int32
  getter battery_volts : Float64
  getter report_interval : Time::Span

  getter mm_rain_accumulation_daily : Float64
  getter mm_rain_accumulation_final : Float64?
  getter mm_rain_accumulation_daily_final : Float64?

  @[JSON::Field(converter: Enum::ValueConverter(PrecipitationAnalysis))]
  getter precipitation_analysis : PrecipitationAnalysis
end
