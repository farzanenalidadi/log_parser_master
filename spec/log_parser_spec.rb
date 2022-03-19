
describe LogParser do
  describe '#generate_report' do
    subject do
      LogParserBuilder.build('spec/fixtures/webserver.log', :space_separated, :plain_text)
    end
    it 'should return yield  plain text format output' do
      mock_output = [
        '####----Most Visits----###',
        "/home \t 1 visit",
        "/contact \t 1 visit",
        '####----Most Unique Visits----###',
        "/home \t 1 unique visit",
        "/contact \t 1 unique visit",
        ''
      ].join("\n")
      expect { subject.generate_report }.to(output(mock_output).to_stdout)
    end

    let(:parser) { instance_double('SpaceSeparatedParser' ,:filename =>'spec/fixtures/webserver.log' ,parse: {"/help_page/1"=>{:visits=>160, :unique_visitors=>Set.new(["184.123.665.067"])}})}
    let(:formatter) { instance_double('PlainTextFormatter') }
    let(:search_visit) { double('VisitsSorter',new: {"/help_page/1"=>{:visits=>160, :unique_visitors=>Set.new(["184.123.665.068"])}} ,:title =>"visit")}
    let(:search_unique) { double('UniqueVisitsSorter' ,new: {"/help_page/1"=>{:visits=>160, :unique_visitors=>Set.new(["184.123.665.068"])}} ,:title =>"unique visit")}

    it 'should return yield plain text format output' do
      mock_output = [
        '####----Most Visits----###',
        "/home \t 1 visit",
        "/contact \t 1 visit",
        '####----Most Unique Visits----###',
        "/home \t 1 unique visit",
        "/contact \t 1 unique visit",
        ''
      ].join("\n")

      allow_any_instance_of(described_class).to receive(:generate_report).and_return(mock_output)
      expect(described_class.new(parser,formatter,[search_visit,search_unique]).generate_report).to match(mock_output)
    end

  end
end
