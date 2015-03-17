require 'pp'

module Sloc
  module Formatters
    class PrettyPrintFormatter
      Loader.formatters[:PrettyPrintFormatter] = self

      def initialize(stream)
        @stream = stream
      end

      def format
        PP.pp(@stream, '')
      end
    end
  end
end
