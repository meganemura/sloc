require 'slop'

module Sloc
  class CLI
    def initialize
      @options = {}
    end

    def run(args = ARGV)
      @options, paths = parse_options(args)

      if paths.empty?
        return help
      end
    end

    def parse_options(args)
      opts = Slop.parse! do |o|
        o.on('-h', '--help', 'Display this help message.')
      end

      [opts, args]
    end

    def help
      puts @options
    end
  end
end
