shared_examples_for Weather do
  describe('#stormy?') do
    it('returns true if the result is a zero') do
      expect(subject).to receive(:rand).and_return(0)
      expect(subject.stormy?).to eq(true)
    end

    it('returns false if the result is greater than zero') do
      expect(subject).to receive(:rand).and_return(1)
      expect(subject.stormy?).to eq(false)
    end
  end
end
