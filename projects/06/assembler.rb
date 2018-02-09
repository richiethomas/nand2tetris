require 'byebug'
require './parser.rb'
require './translator.rb'

class Assembler

  def self.assemble_from_file(file)
    filename_without_suffix = file[0..(file.rindex /.asm/) - 1]

    self.read_and_trim_input_file(file) do |line|
      line = line.chomp
      self.send_to_hack_file(filename_without_suffix) do |file|
        if Parser.instruction_is_decimal?(line)
          output = Translator.convert_number_to_binary(line[1..-1].to_i)
        else
          dest = Translator.extract_dest_from_line(line)
          comp = Translator.extract_comp_from_line(line)
          jump = Translator.extract_jump_from_line(line)

          output = "111#{comp}#{dest}#{jump}"
        end
        file.write "#{output}\n"
      end
    end
  end

  private

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