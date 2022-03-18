require 'parsers/parser_factory'
require 'parsers/space_separated_parser'

describe ParserFactory do
  describe '#create' do
    let(:filename) { 'spec/fixtures/webserver.log' }
    context 'when parser is valid' do
      it 'should return  instance of expected parser class' do
        expect(described_class.create(:space_separated, filename)).to(be_a(SpaceSeparatedParser))
      end
    end
    context 'when parser is invalid' do
      it 'should raise ArgumentError' do
        expect { described_class.create(:invalid_parser, filename) }
          .to(raise_error(ArgumentError))
      end
    end
  end
end
