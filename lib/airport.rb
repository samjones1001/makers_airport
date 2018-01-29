require_relative 'weather'
require_relative 'plane'

class Airport
  include Weather
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def receive(vehicle)
    hangar.push(vehicle)
  end

  def release(vehicle)
    raise 'cannot take off due to weather' if stormy?
    hangar.delete(vehicle)
  end
end
