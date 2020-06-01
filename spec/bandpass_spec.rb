require 'bandpass.rb'

describe Bandpass do
  describe '.filter' do
    it "accepts an array of frequencies, and returns that same array" do
      expect(subject.filter([10])).to eq([10])
    end
  end
end
