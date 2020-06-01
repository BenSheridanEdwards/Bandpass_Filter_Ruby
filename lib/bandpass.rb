class Bandpass

  def initialize(lower_boundary, upper_boundary)
    @lower_boundary = lower_boundary
    @upper_boundary = upper_boundary
  end

  def filter(soundwave) 

    soundwave.each_with_index do |frequency, index|
      soundwave[index] = @upper_boundary if frequency > @upper_boundary
      soundwave[index] = @lower_boundary if frequency < @lower_boundary
    end
    return soundwave
  end
end
