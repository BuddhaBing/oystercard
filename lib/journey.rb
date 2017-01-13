class Journey

  attr_reader :current, :fare

  PENALTY_FARE = 6.0
  FLAT_FEE = 2.0
  ZONE_FARE = 2.0

  def initialize(zone, name)
    @entry_zone = zone
    @current = "#{zone.to_s} - #{name.to_s}"
  end

  def fare(exit_zone, no_penalty=true)
    no_penalty ? fee = ((convert_to_int(@entry_zone) - convert_to_int(exit_zone)).abs * ZONE_FARE) + FLAT_FEE : fee = PENALTY_FARE
  end

  private

  def convert_to_int(zone)
    zone.to_s.gsub!("Zone ", "").to_i
  end

end
