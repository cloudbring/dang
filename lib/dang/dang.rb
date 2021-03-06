require 'stringio'

require 'rubygems'
require 'kpeg'

# require 'dang/parser'

class Dang
  VERSION = '0.1.0'

  @filters = {}

  class << self
    def it(str)
      parser = Dang::Parser.new(str, true)
      unless parser.parse
        io = StringIO.new
        parser.show_error(io)
        raise io.string
      end

      parser.output
    end

    def register_filter(name, filter)
      @filters[name] = filter
    end

    def run_filter(name, text)
      if filter = @filters[name]
        return filter[text]
      else
        raise "Unknown filter: \"#{name}\""
      end
    end
  end

  # A default filter.
  register_filter "raw", proc { |str| str }
end

parser = File.expand_path("../parser.kpeg", __FILE__)
KPeg.load parser, "Dang::Parser"
