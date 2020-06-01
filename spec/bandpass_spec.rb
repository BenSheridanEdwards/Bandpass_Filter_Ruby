require 'bandpass.rb'

describe Bandpass do
  let(:bandpass) { Bandpass.new(30, 80) }

  describe '.filter' do
    it "accepts an array of one frequency, and returns that same array" do
      expect(bandpass.filter([50])).to eq([50])
    end

    it "accepts an array with a range of soundwave frequencies, and returns that same soundwave array" do
      expect(bandpass.filter([40, 50, 40, 60, 40])).to eq([40, 50, 40, 60, 40])
    end

    it "takes an array with frequency that exceeds the upper boundary and sets that frequency to the upper boundary" do
      expect(bandpass.filter([40, 60, 40, 100, 70])).to eq([40, 60, 40, 80, 70])
    end

    it "receives a soundwave with a frequency exceeding the lower boundary and sets that frequency to the lower boundary" do
      expect(bandpass.filter([40, 60, 20, 80, 70])).to eq([40, 60, 30, 80, 70])
    end
  end
end
