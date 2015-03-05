require 'sloc/analyzer'

module Sloc
  class Runner
    def initialize(options)
      @options = options
    end

    def run(paths)
      target_files = find_target_files(paths)

      # TODO: count sloc
      analyzer = Analyzer.new(@options)
      report = target_files.each_with_object({}) do |path, h|
        code      = File.read(path)
        extension = File.extname(path)

        h[path] = analyzer.analyze(code, extension)
      end

      # TODO: formatted output
      require 'pp'
      pp report

      nil
    end

    private

    def find_target_files(paths)
      files = paths.uniq.flat_map do |path|
        if File.directory?(path)
          Dir.glob("#{path}/**/*").select {|f| File.file?(f) }
        else
          path
        end
      end

      files.map {|f| File.expand_path(f) }.uniq
    end
  end
end
