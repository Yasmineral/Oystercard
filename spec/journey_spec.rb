require 'journey'
require 'oystercard'
require 'station'

describe Journey do 
  #it 'adds a new hash into the history array' do
   #     card = Oystercard.new
    #    card.top_up(5)
     #   card.touch_in(@entry_station)
      #  card.touch_out(@exit_station)
       # expect(card.history).to include({ :entry_station => @entry_station, :exit_station => @exit_station })
      #end

describe '#start_journey' do
let(:oystercard) { Oystercard.new.top_up(5) }
let(:station) { double :station }
  it 'changes the entry station varaible to the station that has been touched in' do
    oystercard.touch_in(station)
    expect(entry_station).to eq station
  end

end









end