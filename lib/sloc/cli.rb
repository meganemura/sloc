require 'slop'
require 'sloc/runner'

module Sloc
  class CLI
    def initialize
      @options = {}
    end

    def run(args = ARGV)
      @options, paths = parse_options(args)

      return help if paths.empty? || @options[:help]

      runner = Runner.new(@options)

      runner.run(paths)
    end

    def parse_options(args)
      opts = Slop.parse!(args) do |o|
        o.on('-h', '--help', 'Display this help message.')
        o.on('-o', '--order=', 'Specify key to order by.')
        o.on('--desc', 'Reverse order if specified')
        o.on('-l', '--limit=', 'Specify key to set limitation of displaying file number.')
      end

      [opts, args]
    end

    def help
      puts @options
    end
  end
end
