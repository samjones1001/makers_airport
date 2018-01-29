require 'plane'

describe Plane do
  it('should respond to land') do
    expect(subject).to respond_to(:land).with(1).argument
  end
end
