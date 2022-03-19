require_relative 'sorter'

class VisitsSorter < Sorter
  def self.title
    'Most Visits'
  end

  # Sorted data Iterator with yield block url,count,title
  def each
    @pars_data.each do |key, value|
      yield(key, value[:visits], 'visit')
    end
  end

  private

  def sort_out
    @pars_data = @pars_data.sort_by { |_key, value| value[:visits] }
                           .reverse.to_h
  end
end
