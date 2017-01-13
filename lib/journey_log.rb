class JourneyLog

  attr_reader :journeys, :journey

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = {}
    @journey_count = 0
  end

  def journey_start(station)
    @entry_station = station
    @journey = nil
    @outbound = "#{station.zone.to_s} - #{station.station_name.to_s}"
    current_journey(station.zone, station.station_name)
  end

  def journey_end(station)
    @inbound = "#{station.zone.to_s} - #{station.station_name.to_s}"
    @outbound ? no_penalty = true : current_journey(station.station_name, station.zone)
    add_to_log
    no_penalty ? @journey.fare(station.zone, no_penalty) : @journey.fare(station.zone, no_penalty = false)
  end

  private

  def add_to_log
    @journeys["Journey #{@journey_count += 1}"] = "Outbound: #{@outbound}; Inbound: #{@inbound}"
    @outbound = nil
    @inbound = nil
  end

  def current_journey(name, zone)
    @journey ||= Journey.new(name, zone)
    @journey.current
  end

end
