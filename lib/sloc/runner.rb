require 'sloc/analyzer'

module Sloc
  class Runner
    def initialize(options = {})
      @options = options
    end

    def run(paths)
      # TODO: formatted output
      require 'pp'
      pp report(paths)

      nil
    end

    def report(paths)
      target_files = find_target_files(paths)

      # TODO: count sloc
      analyzer = Analyzer.new(@options)
      report = target_files.each_with_object({}) do |path, h|
        code      = File.read(path)
        extension = File.extname(path)

        h[path] = analyzer.analyze(code, extension)
      end

      report
        .sort_by { |_key, value| value[order] }   # --order=
        .tap { |hash| hash.reverse! if desc? }    # --desc
    end

    private

    def order
      key = @options[:order] ? @options[:order].to_sym : nil
      Analyzer::REPORT_KEYS.include?(key) ? key : Analyzer::REPORT_KEYS.first
    end

    def desc?
      @options[:desc]
    end

    def find_target_files(paths)
      files = paths.uniq.flat_map do |path|
        if File.directory?(path)
          Dir.glob("#{path}/**/*").select { |f| File.file?(f) }
        else
          path
        end
      end

      files.map { |f| File.expand_path(f) }.uniq
    end
  end
end
