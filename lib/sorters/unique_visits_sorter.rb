# frozen_string_literal: true

require_relative 'sorter'

class UniqueVisitsSorter < Sorter
  def self.title
    'Most Unique Visits'
  end

  # Sorted data Iterator with yield block url,count,title
  def each
    @pars_data.each do |key, value|
      yield(key, value[:unique_visitors].length, 'unique visit')
    end
  end

  private

  def sort_out
    @pars_data = @pars_data.sort_by { |_key, value| value[:unique_visitors].length }
                           .reverse.to_h
  end
end
