require 'spec_helper'

describe Sloc::Runner do
  let(:instance) do
    described_class.new
  end

  let(:files) do
    `git ls-files -z`.split("\x0")
  end

  describe '#report' do
    it 'returns hash' do
      expect(instance.report(files)).to be_a Hash
    end
  end
end
