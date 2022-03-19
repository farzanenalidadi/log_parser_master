# frozen_string_literal: true

require_relative 'parsers/parser_factory'
require_relative 'formatters/formatter_factory'
require_relative 'sorters/unique_visits_sorter'
require_relative 'sorters/visits_sorter'
require_relative 'log_parser'
class LogParserBuilder
  def self.build(filename, parser_type, output_format)
    parser = ParserFactory.create(parser_type, filename)
    formatter = FormatterFactory.create(output_format)
    sorters = [VisitsSorter, UniqueVisitsSorter]

    LogParser.new(parser, formatter, sorters)
  end
end
