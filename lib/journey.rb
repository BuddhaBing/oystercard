class Journey

  PENALTY_FARE = 6.6
  NORM_FARE = 3

  def initialize
  end

  

  def fare(entry_station, card)
    #norm_fare = 3
    entry_station ? @fee = NORM_FARE : @fee = PENALTY_FARE
    deduct(card)
  end

  private

  def deduct(card)
    card.balance -= @fee
  end
end
