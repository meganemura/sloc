module Sloc
  module Formatters
    def self.formatters(formatter)
      Loader.formatters[formatter]
    end

    class Loader
      def self.formatters
        @formatters ||= {}
      end
    end
  end
end

require 'sloc/formatters/pretty_print_formatter'
