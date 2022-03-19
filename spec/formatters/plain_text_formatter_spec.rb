# frozen_string_literal: true

describe PlainTextFormatter do
  describe '#format' do
    subject { described_class.new }
    it 'should return  data  with expected format' do
      head = 'Report'
      mock_input_data = [%w[url1 count1 title], %w[url2 count2 title]]
      expected_output = ["####----#{head}----###", "url1 \t count1 title", "url2 \t count2 title", ''].join("\n")
      expect { subject.format(head, mock_input_data) }
        .to(output(expected_output).to_stdout)
    end
  end
end
