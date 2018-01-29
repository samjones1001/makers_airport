require_relative 'weather'
require_relative 'plane'

class Airport
  include Weather
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def receive(vehicle)
    raise 'cannot land due to weather' if stormy?
    raise 'hangar full' if full?
    hangar.push(vehicle)
  end

  def release(vehicle)
    raise 'cannot take off due to weather' if stormy?
    raise 'plane is not in the hangar' if !vehicle_present?(vehicle)
    hangar.delete(vehicle)
  end

  private
  def full?
    hangar.length >= capacity
  end

  def vehicle_present?(vehicle)
    hangar.include?(vehicle)
  end
end
