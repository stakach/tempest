require "./event"

class Tempest::SkyObs < Tempest::Event
  property obs : Array(Tuple(Int64, Int32, Int32, Float64, Float64, Float64, Float64, Int32, Float64, Int32, Int32, Float64, Int32, Int32, Float64, Float64, Int32))

  def observations
    obs.map { |observation| Tempest::Sky.new(*observation) }
  end
end

class Tempest::Sky
  def initialize(
    time : Int64,
    @lux,
    @uv_index,
    @mm_rain,
    @wind_lull,
    @wind_average,
    @wind_gust,
    @wind_direction,
    @battery_volts,
    report_interval,
    @solar_radiation,
    @mm_rain_accumulation,
    precipitation_type,
    wind_sample_interval,
    @mm_rain_accumulation_final,
    @mm_rain_accumulation_daily_final,
    precipitation_analysis
  )
    @time = Time.unix(time)
    @report_interval = interval.minutes
    @precipitation_type = PrecipitationType.from_value precipitation_type
    @wind_sample_interval = wind_sample_interval.minutes
    @precipitation_analysis = PrecipitationAnalysis.from_value precipitation_analysis
  end

  getter time : Time
  getter lux : Int32
  getter uv_index : Int32
  getter mm_rain : Float64
  getter wind_lull : Float64
  getter wind_average : Float64
  getter wind_gust : Float64
  getter wind_direction : Int32

  getter battery_volts : Float64
  getter report_interval : Time::Span
  getter solar_radiation : Int32
  getter mm_rain_accumulation : Float64

  @[JSON::Field(converter: Enum::ValueConverter(PrecipitationType))]
  getter precipitation_type : PrecipitationType
  getter wind_sample_interval : Time::Span
  getter mm_rain_accumulation_final : Float64
  getter mm_rain_accumulation_daily_final : Float64

  @[JSON::Field(converter: Enum::ValueConverter(PrecipitationAnalysis))]
  getter precipitation_analysis : PrecipitationAnalysis
end
