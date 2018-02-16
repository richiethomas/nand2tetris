require 'byebug'
# require './parser.rb'
# require './translator.rb'
require './symbol_table.rb'

class Assembler

  attr_reader :symbol_table

  def initialize
    @symbol_table = SymbolTable.new
  end

  def assemble_from_file(file)
    filename_without_suffix = read_filename(file)
    next_line = 1
    read_and_trim_input_file(file) do |line|
      symbol_table.scan_for_label(line, next_line)
      next_line += 1
    end

    byebug
#     self.read_and_trim_input_file(file) do |line|
#       line = line.chomp
#       write_to_hack_file(file) do |file|
#         file.write "#{Translator.translate(line)}\n"
#       end
#     end
  end

  private

  def read_and_trim_input_file(file, &block)
    File.open(file, "r") do |read_file|
      read_file.each_line do |line|
        line = format(line)
        next if line == ""
        yield "#{line}"
      end
    end
  end

  def read_filename(file)
    file[0..(file.rindex /.asm/) - 1]
  end

  def format(line)
    return strip_newlines(strip_whitespace(strip_comments(line)))
  end

  def strip_newlines(line)
    return line.gsub("\r\n", "")
  end

  def strip_comments(line)
    start_of_comments = line.index(/\/\//)
    line[start_of_comments..-1] = "" if start_of_comments
    return line
  end

  def strip_whitespace(line)
    return line.strip
  end

  def write_to_hack_file(file, &block)
    filename = read_filename(file_argument)
    File.open("#{filename}.hack", "a") do |output_file|
      begin
        yield output_file
      ensure
        output_file.close
      end
    end
  end
end