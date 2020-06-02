require 'bandpass.rb'

describe Bandpass do
  let(:bandpass) { Bandpass.new(30, 80) }

  describe '.filter' do
    it "accepts a soundwave array, that breached no boundries, and returns that same soundwave array" do
      expect(bandpass.filter([40, 60, 40, 60, 40])).to eq([40, 60, 40, 60, 40])
    end

    context "when a soundwave contains a frequency that exceeds the upper boundary" do
      it "converts the single exceeding frequency to the boundary" do
        expect(bandpass.filter([40, 100, 40, 60, 40])).to eq([40, 80, 40, 60, 40])
      end

      it "converts multiple exceeding frequencies to the boundary" do
        expect(bandpass.filter([40, 100, 40, 100, 40])).to eq([40, 80, 40, 80, 40])
      end
    end

    context "when a soundwave contains a frequency that exceeds the lower boundary" do
      it "converts the single exceeding frequency to the boundary" do
        expect(bandpass.filter([20, 60, 40, 60, 40])).to eq([30, 60, 40, 60, 40])
      end

      it "converts multiple exceeding frequencies to the boundary" do
        expect(bandpass.filter([20, 60, 20, 60, 40])).to eq([30, 60, 30, 60, 40])
      end
    end

    context "when a soundwave contains unexpected data" do
      it "throws an argument error when the soundwave contains a string" do
        message = "ArgumentError: Soundwave array can not contain strings"
        expect{ bandpass.filter([40, 60, "", 60, 40]) }.to raise_error message
      end

      it "throws an arguement error when the soundwave contains a negative frequencies" do
        message = "ArgumentError: Soundwave frequencies can not be a negative value"
        expect{ bandpass.filter([40, 60, -40, 60, 40]) }.to raise_error message
      end
    end
  end
end
