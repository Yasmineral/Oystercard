require 'station'
require 'oystercard'
require 'journey'

describe Station do
subject(:station) { described_class.new("Waltho", 3) }

  it 'knows its name' do
    expect(subject.name).to eq("Waltho")
  end

  it 'know its zone' do
    expect(subject.zone).to eq(3)
  end
end
