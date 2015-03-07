require 'spec_helper'

describe Sloc::Analyzer do
  let(:instance) do
    Sloc::Analyzer.new
  end

  describe '#comment_expressions' do
    it 'returns hash of expressions' do
      expect(instance.comment_expressions('.rb')).to eq(:single => /#/,
                                                        :start  => /=begin/,
                                                        :stop   => /=end/)
    end
  end
end
