class JourneyLog

  attr_reader :journeys, :entry_station, :view_journey

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
    current_journey(@entry_station, @entry_zone, true)
  end

  def journey_end(card, station)
    Journey.new.fare(card, @entry_station)
    current_journey(station.station_name, station.zone, false)
  end

  def record_journey
    @journeys["Journey #{@journey_count += 1}"] = "Outbound: #{@outbound}; Inbound: #{@inbound}"
  end

  def report_journey
    @journeys
  end

  private

  def in_journey?
    true if @entry_station
  end

  def current_journey(name, zone, outbound)
    outbound ? @outbound = "#{zone.to_s.gsub!("_", " ").capitalize} - #{name.to_s.capitalize}" : @inbound = "#{zone.to_s.gsub!("_", " ").capitalize} - #{name.to_s.capitalize}"
    @entry_station = nil
    record_journey if !outbound
  end

end
