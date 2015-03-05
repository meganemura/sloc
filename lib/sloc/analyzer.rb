module Sloc
  class Analyzer
    def initialize(options = {})
      @options = options
    end

    def analyze(code, extension)
      result = {}

      code.gsub!(/\r\n|\r/, "\n")

      result[:total]       = code.scan("\n").size
      result[:empty_lines] = code.scan(/^\s*$/).size
      result[:comments]    = 'N/A'  # FIXME

      result
    end

    def single_comment_expression(extension)
      case extension
      when ".rb" then /#/
      when ".vim" then /"/
      else nil
      end
    end
  end
end
