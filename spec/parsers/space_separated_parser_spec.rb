# frozen_string_literal: true

require 'parsers/space_separated_parser'
require 'tempfile' # Use Tempfile class  to create temporary file in test

describe SpaceSeparatedParser do
  describe '#parse' do
    context 'with invalid data and failed' do
      before :each do
        @empty_file = Tempfile.new('empty_file')
        File.write(@empty_file, '')

        @invalid_file = Tempfile.new('invalid_file')
        File.write(@invalid_file, 'This-Is-Invalid-Data')
      end

      it 'file does not exist' do
        expect { described_class.new('dont_exit') }
          .to(raise_error(ArgumentError))
      end

      it 'file is empty' do
        expect { described_class.new(@empty_file) }
          .to(raise_error(ArgumentError))
      end

      it 'file doesnt any valid line' do
        expect { described_class.new(@invalid_file).parse }
          .to(raise_error(ArgumentError))
      end
    end

    context 'with valid data and success' do
      subject { described_class.new('spec/fixtures/webserver.log').parse }
      it 'should parse this file with valid line' do
        mock_result = {
          "/contact" => { unique_visitors: Set.new(["184.123.665.067"]), visits: 1 },
          "/home" => { unique_visitors: Set.new(["184.123.665.067"]), visits: 1 }
        }
        expect(subject).to(eq(mock_result))
      end
    end
  end
end
