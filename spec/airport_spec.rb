require 'airport'

describe Airport do
  let(:plane)   { double :plane }

  it('initializes with an empty hangar') do
    expect(subject.hangar).to eq([])
  end

  describe('#receive') do
    it('stores the passed vehicle in the hangar') do
      subject.receive(plane)
      expect(subject.hangar).to include(plane)
    end
  end

  describe('#release') do
    it('removes the passed vehicle from the hangar') do
      subject.receive(plane)
      subject.release(plane)
      expect(subject.hangar).to_not include(plane)
    end
  end
end
