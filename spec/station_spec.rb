require 'station'
require 'oystercard'
require 'journey'

describe Station do
let(:station) { described_class.new }

  it 'contains a Zone variable' do
    expect(station).to respond_to(:zone)  
  end

  it 'contains a Name variable' do
    expect(station).to respond_to(:name)
  end
end