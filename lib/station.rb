class Station

  STATIONS = {zone_1: %w(Old\ Street Angel Pimlico Tower\ Gateway),
              zone_2: %w(Stoke\ Newington Stratford Stratford\ High\ Street Stratford\ International),
              zone_3: %w(Stamford\ Hill Star\ Lane Stonebridge\ Park Stratford),
              zone_4: %w(Seven\ Kings Shortlands Silver\ Street Snaresbrook)}

  attr_reader :zone, :station_name

  def initialize
    @zone = STATIONS.keys.sample
    @station_name = STATIONS[@zone].shuffle.sample
  end

end
