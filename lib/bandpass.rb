class Bandpass

  def initialize(lower_boundary, upper_boundary)
    @lower_boundary = lower_boundary
    @upper_boundary = upper_boundary
  end

  def filter(soundwave) 
    raise "ArgumentError: Soundwaves must contain at least 5 frequencies" if less_than_five_frequencies_in(soundwave)

    soundwave.each_with_index do |frequency, index|
      raise "ArgumentError: Soundwave array can not contain strings" if frequency.instance_of?(String)
      raise "ArgumentError: Soundwave frequencies can not be a negative value" if frequency < 0

      soundwave[index] = @upper_boundary if frequency > @upper_boundary
      soundwave[index] = @lower_boundary if frequency < @lower_boundary
    end
    return soundwave
  end

  private

  def less_than_five_frequencies_in(soundwave)
    soundwave.length < 5
  end
end
