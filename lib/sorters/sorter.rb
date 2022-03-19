# frozen_string_literal: true

class Sorter
  include Enumerable

  def initialize(parse_data)
    @pars_data = parse_data
    sort_out
  end

  def each
    not_implemented!
  end

  def self.title
    not_implemented!
  end

  private

  def sort_out
    not_implemented!
  end

  def not_implemented!
    raise(NotImplementedError, 'A Sorter class cannot be used. Use a subclass')
  end
end
