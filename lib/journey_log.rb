class JourneyLog

  attr_reader :journeys, :entry_station

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = {}
    @journey_count = 0
  end

  def journey_start(card, station)
    @entry_station = station.station_name
    @entry_zone = station.zone
    @card = card
    record_journey(@entry_station, @entry_zone, true)
  end

  def journey_end(card, station)
    Journey.new.fare(card, @entry_station, @entry_zone, @exit_zone)
    record_journey(station.station_name, station.zone, false)
  end

  def current_journey
    @journeys.values.last
  end

  private

  def record_journey(name, zone, outbound)
    outbound ? @outbound = "#{zone.to_s} - #{name.to_s}" : @inbound = "#{zone.to_s} - #{name.to_s}"
    add_to_log if !outbound
    outbound ? @outbound : @inbound
  end

  def add_to_log
    @journeys["Journey #{@journey_count += 1}"] = "Outbound: #{@outbound}; Inbound: #{@inbound}"
    @entry_station = nil
  end

end
