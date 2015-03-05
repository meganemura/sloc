module Sloc
  class Runner
    def initialize(options)
      @options = options
    end

    def run(paths)
      target_files = find_target_files(paths)

      # TODO: count sloc
      report = target_files.each_with_object({}) do |e, h|
        h[e] = count(e)
      end

      # TODO: formatted output
      p report

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

    # XXX
    def count(path)
      File.read(path).lines.size
    end
  end
end
