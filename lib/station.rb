class Station

  STATIONS = {"Zone 1": %w(Old\ Street Angel Pimlico Tower\ Gateway),
              "Zone 2": %w(Stoke\ Newington Stratford Stratford\ High\ Street Stratford\ International),
              "Zone 3": %w(Stamford\ Hill Star\ Lane Stonebridge\ Park Stratford),
              "Zone 4": %w(Seven\ Kings Shortlands Silver\ Street Snaresbrook)}

  attr_reader :zone, :station_name

  def initialize
    @zone = STATIONS.keys.sample
    @station_name = STATIONS[@zone].shuffle.sample
  end

end
