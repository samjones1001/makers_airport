require 'plane'

describe Plane do
  let(:airport) { double :airport, :receive => subject, :release => subject }

  it('should respond to land') do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it('should respond to take_off') do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  context('when plane is not grounded') do
    describe('#land') do
      it('should cause the passed airport to receive the plane') do
        expect(airport).to receive(:receive)
        subject.land(airport)
      end
    end

    describe('#take_off') do
      it('should raise an error') do
        expect{ subject.take_off(airport) }.to raise_error 'plane is already airborne'
      end
    end
  end

  context('when plane is grounded') do
    describe('#take_off') do
      it('should cause the passed airport to release the plane') do
        subject.land(airport)
        expect(airport).to receive(:release)
        subject.take_off(airport)
      end
    end

    describe('#land') do
      it('should raise an error') do
        subject.land(airport)
        expect{ subject.land(airport) }.to raise_error 'plane is already grounded'
      end
    end
  end



end
