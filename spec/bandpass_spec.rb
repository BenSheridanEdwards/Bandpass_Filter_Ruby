require 'bandpass.rb'

describe Bandpass do
  describe '.filter' do
    it "accepts an array of one frequency, and returns that same array" do
      expect(subject.filter([10])).to eq([10])
    end

    it "accepts an array with a range of soundwave frequencies, and returns that same soundwave array" do
      expect(subject.filter([30, 50, 40, 60, 40])).to eq([30, 50, 40, 60, 40])
    end
  end
end
