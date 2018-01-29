class Plane
  def land(location)
    location.receive(self)
  end

  def take_off(location)
    location.release(self)
  end
end
