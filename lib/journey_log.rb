class JourneyLog
    
  attr_reader :journeys, :entry_station, :exit_station, :trip
  
  def initialize(journey = Journey.new)
    @journeys = Hash.new
    @journey = journey
  end
  
  def journey_start(card, station)
    @entry_station = station.station_name
    @entry_zone = station.zone
    @card = card
    current_journey
  end
  
  def journey_end(card, station)
    @exit_station = station.station_name
    @exit_zone = station.zone
    @journey.fare(@entry_station, card)
    current_journey
    record_journey
  end

  def record_journey
    @journeys["Journey #{@journeys.size + 1}"] = ["#{@entry_zone}: #{@entry_station}", "#{@exit_zone}: #{@exit_station}"]
    @entry_station = nil
  end
  
  private
  
  def current_journey
    @trip = ["#{@entry_zone}: #{@entry_station}", "#{@exit_zone}: #{@exit_station}"]
  end
end