require 'oystercard'

describe Oystercard do
  let(:oystercard) { described_class.new}    
  
  describe '#initialize' do
    it 'initializes with a balance of 0 if no value is given by the user' do
    expect(oystercard.balance).to eq 0
    end
  end
  
  describe '#top_up' do
    it 'increases the total balance with the amount inputted by the user' do
      expect { oystercard.top_up(1) }.to change { oystercard.balance }.by (1)
    end
    
    it 'rasises an error if balance total exceeds maximum balance' do
      expect { oystercard.top_up(100) }.to raise_error("Exceeds £#{oystercard.maximum} maximum limit")
    end
  end
end

