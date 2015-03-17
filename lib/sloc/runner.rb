require 'sloc/analyzer'
require 'sloc/formatters'

module Sloc
  class Runner
    def initialize(options = {})
      @options = options
      @analyzer = Analyzer.new(@options)
    end

    def run(paths)
      report(paths)
    end

    def report(paths)
      formatter = formatter_class.new(raw_report(paths))
      formatter.format
    end

    def raw_report(paths)
      target_files = find_target_files(paths)

      # TODO: count sloc
      report = target_files.each_with_object({}) do |path, h|
        code      = File.read(path)
        extension = File.extname(path)

        h[path] = @analyzer.analyze(code, extension)
      end

      process_options(report)
    end

    private

    def formatter_class
      Formatters.formatters(formatter_class_name)
    end

    def formatter_class_name
      @options[:format].to_sym
    end

    def process_options(report)
      r = report
          .sort_by { |_key, value| value[order] }   # --order=
          .tap { |hash| hash.reverse! if desc? }    # --desc

      if limit?
        Hash[r.first(limitation)]
      else
        Hash[r]
      end
    end

    def order
      key = @options[:order] ? @options[:order].to_sym : nil
      Analyzer::REPORT_KEYS.include?(key) ? key : Analyzer::REPORT_KEYS.first
    end

    def desc?
      @options[:desc]
    end

    def limit?
      !limitation.nil?
    end

    def limitation
      @options[:limit] ? [@options[:limit].to_i, 0].max : nil
    end

    def find_target_files(paths)
      files = paths.uniq.flat_map do |path|
        if File.directory?(path)
          Dir.glob("#{path}/**/*").select { |f| File.file?(f) }
        else
          File.exist?(path) ? path : nil
        end
      end

      files.compact.map { |f| File.expand_path(f) }.uniq
    end
  end
end
