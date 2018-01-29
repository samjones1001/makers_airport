require_relative 'weather'
require_relative 'plane'

class Airport
  include Weather
  attr_reader :hangar, :capacity
  CAPACITY = 10

  def initialize
    @hangar = []
    @capacity = CAPACITY
  end

  def receive(vehicle)
    raise 'cannot land due to weather' if stormy?
    raise 'hangar full' if full?
    hangar.push(vehicle)
  end

  def release(vehicle)
    raise 'cannot take off due to weather' if stormy?
    hangar.delete(vehicle)
  end

  private
  def full?
    hangar.length >= capacity
  end
end
