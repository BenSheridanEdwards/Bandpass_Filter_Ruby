class Bandpass

  def initialize(lower_boundary, upper_boundary)
    @lower_boundary = lower_boundary
    @upper_boundary = upper_boundary
  end

  def filter(soundwave) 
    raise "ArgumentError: Soundwaves must contain at least 5 frequencies" if less_than_five_frequencies_in(soundwave)

    soundwave.each_with_index do |frequency, index|
      raise "ArgumentError: Soundwave array can not contain strings" if string_data_type(frequency)
      raise "ArgumentError: Soundwave frequencies can not be a negative value" if negative(frequency)

      soundwave[index] = @upper_boundary if frequency > @upper_boundary
      soundwave[index] = @lower_boundary if frequency < @lower_boundary
    end
    return soundwave
  end

  private

  def less_than_five_frequencies_in(soundwave)
    soundwave.length < 5
  end

  def string_data_type(frequency)
    frequency.instance_of?(String)
  end

  def negative(frequency)
    frequency < 0
  end
end
