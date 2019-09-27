require 'journey'
require 'oystercard'
require 'station'

describe Journey do  
  subject(:journey) { described_class.new }
  let(:station) { double(:station) }
  let(:station2) { double(:station2) }

  it 'can retrieve its journey history' do
    journey.start_journey(station)
    journey.end_journey(station)
    expect(journey.journey_history).to eq [{ :entry_station => station, :exit_station => station }] 
  end
    
  describe '#start_journey' do
    it 'starts a journey' do
      expect(journey.start_journey(station)).to eq station
    end
    it 'sets entry_station variable to station' do
      journey.start_journey(station)  
      expect(subject.entry_station).to eq station
    end
    it 'stores pentalty journeys if touched in twice' do
      journey.start_journey(station)
      journey.start_journey(station2)
      expect(journey.journey_history).to eq [{ :entry_station => station, :exit_station => nil }]
    end
  end

  describe '#end_journey' do
    it 'calculates the fare upon exiting the station' do
      journey.start_journey(station)
      journey.end_journey(station)
      expect(journey.fare).to eq 1 
    end
    it 'stores penalty journeys if touched out twice' do
      journey.end_journey(station)
      expect(journey.journey_history).to eq [{ :entry_station => nil, :exit_station => station }]
    end
  end

  describe '#fare' do
    it 'charges a penalty fare if user is in an active journey' do
      journey.end_journey(station)
      expect(journey.fare).to eq 6
    end
  end
end