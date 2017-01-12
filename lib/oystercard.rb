require_relative 'station'
require_relative 'journey'
require_relative 'journey_log'

# TODO create Printer class and iterate through journeys to output the hash as a string
# TODO stop passing card around so much

class Oystercard
  attr_reader :journeys
  attr_accessor :balance

  LIMIT = 90.0

  def initialize(journey_log = JourneyLog.new)
    @balance = 5.00
    @journey_log = journey_log
    @journeys = journey_log.journeys
    @journey = journey_log.current_journey
  end

  def top_up(add_money)
    raise "Top up would exceed the card's balance limit of £#{LIMIT}" if @balance + add_money.to_f > LIMIT
    @balance += add_money.to_f
  end

  def touch_in(card = self, station = Station.new)
    #@journey_log.journey_end(card, station, true) if @journey_log.entry_station
    raise 'Insufficient balance on card.' if @balance < Journey::PENALTY_FARE
    @journey_log.journey_start(card, station)
  end

  def touch_out(card = self, station = Station.new)
    @journey_log.journey_end(card, station)
  end
end
