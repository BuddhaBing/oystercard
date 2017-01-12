require 'journey'

describe Journey do
  let(:card) { Oystercard.new }
  let(:card2) { double(:card, balance: 10)}
  let(:start_station) { Station.new }
  #let(:end_station) { Station.new }
  #let(:start_station) { double(:station, zone: 1)}
  #let(:end_station) { double(:station, zone: 3)}

  it 'should deduct a penalty from the card if user doesnt touch in' do
    ded_amnt = Journey::PENALTY_FARE
    card.top_up(10)
    orig_amnt = card.balance
    card.touch_out
    expect(card.balance).to eq(orig_amnt - ded_amnt)
  end

  it 'should deduct money from the card' do
    card.top_up(10)
    card.touch_in
    expect{card.touch_out}.to change {card.balance}
  end

  def calculate_fare(first_station, end_station)
    first_zone = first_station.zone
    end_zone = end_station.zone
    ((first_zone.to_s.gsub!("zone_", "").to_i - end_zone.to_s.gsub!("zone_", "").to_i).abs * Journey::FLAT_FEE) + Journey::FLAT_FEE
  end

  it 'calculates the fare based on the number of zones crossed' do
    first_station = Station.new
    end_station = Station.new
    card.top_up(10)
    card.touch_in(card, first_station)
    zones_crossed = calculate_fare(first_station, end_station)
    expect{card.touch_out(card, end_station)}.to change {card.balance}.by(zones_crossed)
  end

end
