# frozen_string_literal: true

# Use Set class for create unique list
require 'set'

# SpaceSeparatedParser give  filename as argument that this file contain page_url and ip in each line
# In this class pars file line and validate line then calculate visit count and unique visit and append in hash
class SpaceSeparatedParser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @pars_data = {}
    return if file_valid?(filename)

    raise(ArgumentError, 'The file does not exist, or is empty!')
  end

  def parse
    File.open(filename, 'r').each_line do |line|
      line = line.strip
      next unless line_valid?(line)

      append_line(line)
    end

    return @pars_data unless @pars_data.empty?

    raise(ArgumentError, 'The file have  not any valid line!')
  end

  private

  def file_valid?(filename)
    return false unless File.exist?(filename)
    return false if File.size(filename) <= 0

    true
  end

  def line_valid?(line)
    return false if !line || (line.length <= 0)
    return false unless line.match?(%r{^/\w+(/\w+)*(/)? (\d{1,3}\.){3}\d{1,3}$}) # w:[a-zA-Z0-9_] ,d: [0-9]

    true
  end

  def append_line(line)
    url, ip = line.split
    @pars_data[url] ||= { visits: 0, unique_visitors: Set.new }
    @pars_data[url][:visits] += 1
    @pars_data[url][:unique_visitors].add(ip)
  end
end
