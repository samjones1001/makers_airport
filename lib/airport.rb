require_relative 'plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def receive(vehicle)
    hangar.push(vehicle)
  end

  def release(vehicle)
    hangar.delete(vehicle)
  end
end
