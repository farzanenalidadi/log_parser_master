# frozen_string_literal: true

require 'sorters/sorter'

describe Sorter do
  describe '#initialize' do
    it 'should return NotImplementedError' do
      expect { described_class.new({}) }
        .to(raise_error(NotImplementedError))
    end
  end

  describe '#each' do
    it 'should return NotImplementedError' do
      expect { described_class.new({}).each }
        .to(raise_error(NotImplementedError))
    end
  end

  describe '#title' do
    it 'should return NotImplementedError' do
      expect { described_class.new({}).title }
        .to(raise_error(NotImplementedError))
    end
  end
end
