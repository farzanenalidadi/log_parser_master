
require 'log_parser'
require 'log_parser_builder'

describe LogParserBuilder do
  describe '#build' do
    let(:log_parser) {class_double('LogParser')}

    subject do
      described_class.build('spec/fixtures/webserver.log', :space_separated, :plain_text)
    end
    context 'build instance of log parser' do
      it 'should return instance of Log Parser' do
        expect(subject).to(be_a(LogParser))
      end
      it 'should return instance of Log Parser' do
        allow(described_class).to receive(:build).with('spec/fixtures/webserver.log', :space_separated, :plain_text).and_return(log_parser)
        expect(subject).to(eq(log_parser))
      end

    end
    let(:parser_factory) { class_double(ParserFactory) }
    let(:space_parser) { instance_double(SpaceSeparatedParser ,:filename =>'spec/fixtures/webserver.log' ) }
    it do
      allow(parser_factory).to receive(:create).with(any_args).and_return(space_parser)
      expect(parser_factory.create(:space_separated,'spec/fixtures/webserver.log')).to eq space_parser
    end

    let(:formatter_factory) { class_double(FormatterFactory) }
    let(:plain_text_formatter) { instance_double(PlainTextFormatter) }
    it do
      allow(formatter_factory).to receive(:create).with(any_args).and_return(plain_text_formatter)
      expect(formatter_factory.create(:plain_text)).to eq plain_text_formatter
    end

  end
end
