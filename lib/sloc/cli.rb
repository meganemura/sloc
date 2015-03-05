require 'slop'
require 'sloc/runner'

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

      runner = Runner.new(@options)

      runner.run(paths)
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
