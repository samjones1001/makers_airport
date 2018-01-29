require 'airport'
require 'support/shared_examples_for_weather'

describe Airport do
  it_behaves_like Weather

  let(:plane)   { double :plane }

  it('initializes with an empty hangar') do
    expect(subject.hangar).to eq([])
  end

  context('when weather is clear') do
    before(:each) do
      allow(subject).to receive(:rand).and_return(1)
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

  context('when weather is stormy') do
    before(:each) do
      allow(subject).to receive(:rand).and_return(0)
    end

    describe('#receive') do
      it('raises an error') do
        expect{ subject.receive(plane) }.to raise_error('cannot land due to weather')
      end
    end

    describe('#release') do
      it('raises an error') do
        expect{ subject.release(plane) }.to raise_error('cannot take off due to weather')
      end
    end
  end
end
