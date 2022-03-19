# frozen_string_literal: true

require_relative 'plain_text_formatter'

class FormatterFactory
  def self.create(format)
    return PlainTextFormatter.new if format == :plain_text

    raise(ArgumentError, "The #{format} format has not been implemented")
  end
end
