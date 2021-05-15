module Tempest
  enum PrecipitationType
    Nothing = 0
    Rain
    Hail
  end

  enum PrecipitationAnalysis
    Nothing             = 0
    RainCheckDisplayOn
    RainCheckDisplayOff
  end
end

require "./tempest/*"
