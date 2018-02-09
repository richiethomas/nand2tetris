require 'byebug'
require './parser.rb'

input_file = ARGV[0]
filename_without_suffix = input_file[0..(input_file.rindex /.asm/) - 1]

def read_and_trim_input_file(input_file, &block)
  File.open(input_file, "r") do |read_file|
    read_file.each_line do |line|
      line = line.gsub("\r\n", "")
      next if ["//", ""].include? line.strip[0..1]
      yield "#{line}\n"
    end
  end
end

def send_to_hack_file(output_filename, &block)
  File.open("#{output_filename}.hack", "a") do |output_file|
    begin
      yield output_file
    ensure
      output_file.close
    end
  end
end

def convert_number_to_binary(number)
  number = number.to_s(2)
  return "#{'0' * (16 - number.length)}#{number}"
end

def extract_dest_from_line(line)
  dest = Parser.parse_dest(line)

  return "000" unless dest

  a = dest.include?('A') ? 1 : 0
  m = dest.include?('M') ? 1 : 0
  d = dest.include?('D') ? 1 : 0

  return "#{a}#{d}#{m}"
end

def extract_comp_from_line(line)
  comp = Parser.parse_comp(line)
  a = comp.include?("M") ? 1 : 0
  c = case comp
  when "0"
    "101010"
  when "1"
    "111111"
  when "-1"
    "111010"
  when "D"
    "001100"
  when "A", "M"
    "110000"
  when "!D"
    "001101"
  when "!A", "!M"
    "110001"
  when "-D"
    "001111"
  when "-A", "-M"
    "110011"
  when "D+1"
    "011111"
  when "A+1", "M+1"
    "110111"
  when "D-1"
    "001110"
  when "M-1", "A-1"
    "110010"
  when "D+A", "D+M"
    "000010"
  when "D-A", "D-M"
    "010011"
  when "A-D", "M-D"
    "000111"
  when "D&A", "D&M"
    "000000"
  when "D|A", "D|M"
    "010101"
  else
    nil
  end
  return "#{a}#{c}"
end

def extract_jump_from_line(line)
  jump = Parser.parse_jump(line)

  case jump
  when "JGT"
    return "001"
  when "JEQ"
    return "010"
  when "JGE"
    return "011"
  when "JLT"
    return "100"
  when "JNE"
    return "101"
  when "JLE"
    return "110"
  when "JMP"
    return "111"
  else
    return "000"
  end
end

#------------------------

read_and_trim_input_file(input_file) do |line|
  line = line.chomp
  send_to_hack_file(filename_without_suffix) do |file|
    if Parser.instruction_is_decimal?(line)
      output = convert_number_to_binary(line[1..-1].to_i)
    else
      dest = extract_dest_from_line(line)
      comp = extract_comp_from_line(line)
      jump = extract_jump_from_line(line)

      output = "111#{comp}#{dest}#{jump}"
    end
    p output
  end
end
