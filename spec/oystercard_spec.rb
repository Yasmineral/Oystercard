require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new}    
  
  describe '#initialize' do
    it 'initializes with a balance of 0 if no value is given by the user' do
    subject
    expect(oystercard.balance).to eq 0
    end
  end
  
  describe '#top_up' do
    it 'increases the total balance with the amount inputted by the user' do
    expect { subject.top_up(1) }.to change { subject.balance }.by (1)
    end
  end
end

