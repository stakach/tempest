require "./event"

class Tempest::Lightning < Tempest::Event
  property evt : Tuple(Int64, Int32, Int32)

  def time
    Time.unix(@evt[0])
  end

  def kilometers
    @evt[1]
  end

  def energy
    @evt[2]
  end
end

class Tempest::Raining < Tempest::Event
end

class Tempest::DeviceOnline < Tempest::Event
end

class Tempest::DeviceOffline < Tempest::Event
end

class Tempest::StationOnline < Tempest::Event
end

class Tempest::StationOffline < Tempest::Event
end
