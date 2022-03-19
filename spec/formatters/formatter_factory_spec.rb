require 'formatters/formatter_factory'
require 'formatters/plain_text_formatter'

describe FormatterFactory do
  describe '#create' do
    context 'when format is valid' do
      it 'should return instance of expected format class ' do
        expect(described_class.create(:plain_text)).to(be_a(PlainTextFormatter))
      end
    end
    context 'when format is invalid' do
      it 'should raise ArgumentError' do
        expect { described_class.create(:invalid_format) }
          .to(raise_error(ArgumentError))
      end
    end
  end
end
