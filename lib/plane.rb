class Plane
  attr_accessor :grounded

  def initialize
    @grounded = false
  end

  def land(location)
    raise 'plane is already grounded' if grounded
    location.receive(self)
    self.grounded= true
  end

  def take_off(location)
    raise 'plane is already airborne' if !grounded?
    location.release(self)
    self.grounded= false
  end

  private
  def grounded?
    grounded
  end
end
