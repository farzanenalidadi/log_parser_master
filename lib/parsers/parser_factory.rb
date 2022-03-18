
require_relative 'space_separated_parser'

class ParserFactory
  def self.create(type, filename)
    return SpaceSeparatedParser.new(filename) if type == :space_separated

    raise(ArgumentError, "Parser for #{type} logs is not implemented.")
  end
end
