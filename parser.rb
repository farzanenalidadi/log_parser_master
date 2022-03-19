#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require_relative 'lib/log_parser_builder'

Options = Struct.new(:filename, :type, :out_format)
args = Options.new(nil, :space_separated, :plain_text)
opt_parser =
  OptionParser.new do |opts|
    opts.banner = "Usage: ./parser.rb [--input-format=INFMT] [--output-format=OUTFMT] filename"

    opts.on("-tTYPE", "--type=TYPE", "TYPE of parser") do |type|
      args.type = type.to_sym
    end

    opts.on("-fFORMAT", "--format=FORMAT", "FORMAT of output") do |format|
      args.out_format = format.to_sym
    end

    opts.on(
      "-h",
      "--help",
      " You should write: ./parser.rb public/webserver.log -t space_separated -f plain_text"
    ) do
      puts(opts)
      exit
    end
  end
opt_parser.parse!
args.filename = ARGV.pop

unless args.filename
  puts "Please write filename as argument"
  exit(1)
end

begin
  log_parser = LogParserBuilder.build(args.filename, args.type, args.out_format)
rescue ArgumentError => e
  puts(e)
  exit(2)
end

log_parser.generate_report
