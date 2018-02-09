require 'byebug'
require './parser.rb'
require './translator.rb'

class Assembler
  def self.read_and_trim_input_file(input_file, &block)
    File.open(input_file, "r") do |read_file|
      read_file.each_line do |line|
        line = line.gsub("\r\n", "")
        next if ["//", ""].include? line.strip[0..1]
        yield "#{line}\n"
      end
    end
  end

  def self.send_to_hack_file(output_filename, &block)
    File.open("#{output_filename}.hack", "a") do |output_file|
      begin
        yield output_file
      ensure
        output_file.close
      end
    end
  end
end