class Journey

  PENALTY_FARE = 6.0
  FLAT_FEE = 2.0

  def fare(card, entry_station=nil, entry_zone, exit_zone)
    entry_station ? fee = ((convert_to_int(entry_zone) - convert_to_int(exit_zone)).abs * FLAT_FEE) + FLAT_FEE : fee = PENALTY_FARE
    deduct(card, fee)
  end

  private
  
  def convert_to_int(zone)
    zone.to_s.gsub!("zone_", "").to_i.abs
  end

  def deduct(card, fee)
    card.balance -= fee
  end
end
