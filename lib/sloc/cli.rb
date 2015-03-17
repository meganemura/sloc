require 'slop'
require 'sloc/runner'

module Sloc
  class CLI
    def initialize
      @options = {}
    end

    def run(args = ARGV)
      setup(args)
      if help?
        puts help
      else
        puts @runner.run(@paths)
      end
    end

    def report(args = ARGV)
      setup(args)
      if help?
        help
      else
        @runner.report(@paths)
      end
    end

    def setup(args)
      @options, @paths = parse_options(args)
      @runner = Runner.new(@options)

      nil
    end

    def parse_options(args)
      opts = Slop.parse!(args) do |o|
        o.banner 'Usage: sloc [options] fil1, file2, ...'

        o.on('-h', '--help', 'Display this help message.')
        o.on('-o', '--order=', 'Specify key to order by.')
        o.on('--desc', 'Reverse order if specified.')
        o.on('-l', '--limit=', 'Specify key to set limitation of displaying file number.')
      end

      [opts, args]
    end

    attr_reader :options
    alias_method :help, :options

    def help?
      @paths.empty? || @options[:help]
    end
  end
end
