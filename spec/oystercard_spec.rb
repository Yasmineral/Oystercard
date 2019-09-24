require 'oystercard'

describe Oystercard do
  let(:oystercard) { described_class.new}
  it {is_expected.to respond_to :in_journey?}


  describe '#initialize' do
    it 'initializes with a balance of 0 if no value is given by the user' do
    expect(oystercard.balance).to eq 0
    end
    it 'initializes in an inactive state' do
      oystercard = Oystercard.new
      expect(oystercard.active).to be false
    end
  end

  describe '#touch_in' do
    it {is_expected.to respond_to :touch_in}
    it 'changes active status to true when it has been touched in' do
    oystercard.touch_in
    expect(oystercard.active).to be true
  end
  end
  describe '#touch_out'do
  it {is_expected.to respond_to :touch_out}
  it 'changes active status to false when it has been touched out' do
  oystercard.touch_in
  oystercard.touch_out
  expect(oystercard.active).to be false
  end
  end

  describe '#top_up' do
    it 'increases the total balance with the amount inputted by the user' do
      expect { oystercard.top_up(1) }.to change { oystercard.balance }.by 1
    end

    it 'rasises an error if balance total exceeds maximum balance' do
      expect { oystercard.top_up(100) }.to raise_error("Exceeds £#{oystercard.maximum} maximum limit")
    end
  end
  describe '#deduct' do
    it 'should be able to decuct a fare' do
      oystercard.top_up(10)
      expect {oystercard.deduct 5}.to change{oystercard.balance}.by -5
    end
  end
end
