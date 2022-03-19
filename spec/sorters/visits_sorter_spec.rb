require 'sorters/visits_sorter'
require 'set'

describe VisitsSorter do
  describe '#title' do
    it 'should return expected name ' do
      expect(described_class.title).to(eq('Most Visits'))
    end
  end

  describe '#each' do
    context 'valid data parsed' do
      subject do
        pars_data = {
          url5: { unique_visitors: Set.new(['061.945.150.735']), visits: 1 },
          url2: { unique_visitors: Set.new(['444.701.448.104']), visits: 4 }
        }
        described_class.new(pars_data)
      end

      it 'should sort valid pars data' do
        expect { |block| subject.each(&block) }
          .to(yield_successive_args([:url2, 4, 'visit'], [:url5, 1, 'visit']))
      end
    end
  end
end
