require "./event"

class Tempest::Wind < Tempest::Event
  property obs : Tuple(Int64, Float64, Int32)

  def time
    Time.unix(@ob[0])
  end

  def meters_per_second
    @ob[1]
  end

  def degrees
    @ob[2]
  end

  def observations
    [self]
  end
end
