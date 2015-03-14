require 'spec_helper'

describe Sloc::Runner do
  let(:instance) do
    described_class.new(options)
  end

  let(:options) do
    {}
  end

  let(:files) do
    `git ls-files -z`.split("\x0")
  end

  describe '#report' do
    context 'with no options' do
      it 'returns hash' do
        expect(instance.report(files)).to be_a Hash
      end
    end

    context 'with order options' do
      let(:options) do
        { order: Sloc::Analyzer::REPORT_KEYS.sample }
      end

      let(:report) do
        instance.report(files)
      end

      let(:order) do
        options[:order]
      end

      it 'returns hash' do
        expect(report).to be_a Hash
      end

      it 'returns hash and it is ordered' do
        report.each_cons(2) do |(_ak, av), (_bk, bv)|
          expect(av[order] <= bv[order]).to be true
        end
      end
    end
  end
end
