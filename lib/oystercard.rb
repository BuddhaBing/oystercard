require_relative 'station'
require_relative 'journey'
require_relative 'journey_log'
require 'pry'

# TODO deduct penalty if user does not touch out

class Oystercard
  attr_reader :journeys, :journey, :journey_log
  attr_accessor :balance

  LIMIT = 90.0

  def initialize(journey_log = JourneyLog.new)
    @balance = 5.00
    @journey_log = journey_log
    @journeys = journey_log.journeys
    @journey = journey_log.journey
  end

  def top_up(add_money)
    raise "Top up would exceed the card's balance limit of £#{LIMIT}" if @balance + add_money.to_f > LIMIT
    "Top up successful. New balance: #{@balance += add_money.to_f}"
  end

  def touch_in(station = Station.new)
    raise 'Insufficient balance on card.' if @balance < Journey::PENALTY_FARE
    @journey_log.journey_start(station)
  end

  def touch_out(station = Station.new)
    deduct(@journey_log.journey_end(station))
  end

  private

  def deduct(fee)
    "Journey fare: #{fee}; New balance: #{@balance -= fee}"
  end

end

#card = Oystercard.new
#card.top_up(50)
#card.touch_in
#card.touch_out
#binding.pry
#card.touch_out
