
class LogParser
  attr_reader :parser, :formatter, :sorters

  def initialize(parser, formatter, sorters)
    @parser = parser.parse
    @formatter = formatter
    @sorters = sorters
  end

  def generate_report
    sorters.each do |sorter|
      sorted_data = sorter.new(parser)
      formatter.format(sorter.title, sorted_data)
    end
  end
end
