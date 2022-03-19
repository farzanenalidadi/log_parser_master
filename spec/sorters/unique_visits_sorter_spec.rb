
require 'sorters/unique_visits_sorter'
require 'set'

describe UniqueVisitsSorter do
  describe '#title' do
    it 'should return expected name ' do
      expect(described_class.title).to(eq('Most Unique Visits'))
    end
  end

  describe '#each' do
    context 'valid data parsed' do
      subject do
        pars_data = {
          url5: {
            unique_visitors: Set.new(['126.318.035.038', '929.398.951.889', '722.247.931.582', '646.865.545.408']),
            visits: 4
          },
          url2: { unique_visitors: Set.new(['444.701.448.104']), visits: 8 }

        }
        described_class.new(pars_data)
      end

      it 'should sort valid pars data' do
        expect do |block|
          subject.each(&block)
        end.to(yield_successive_args([:url5, 4, 'unique visit'], [:url2, 1, 'unique visit']))
      end
    end
  end
end
