require './parser.rb'
require 'byebug'

class Translator
  def self.convert_number_to_binary(number)
    number = number.to_s(2)
    return "#{'0' * (16 - number.length)}#{number}"
  end

  def self.extract_dest_from_line(line)
    dest = Parser.parse_dest(line)

    return "000" unless dest

    a = dest.include?('A') ? 1 : 0
    m = dest.include?('M') ? 1 : 0
    d = dest.include?('D') ? 1 : 0
    # byebug
    return "#{a}#{d}#{m}"
  end

  def self.extract_comp_from_line(line)
    comp = Parser.parse_comp(line)
    a_bit = comp.include?("M") ? 1 : 0
    c_bits = case comp
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
    # byebug
    return "#{a_bit}#{c_bits}"
  end

  def self.extract_jump_from_line(line)
    jump = Parser.parse_jump(line)

    output = case jump
    when "JGT"
      "001"
    when "JEQ"
      "010"
    when "JGE"
      "011"
    when "JLT"
      "100"
    when "JNE"
      "101"
    when "JLE"
      "110"
    when "JMP"
      "111"
    else
      "000"
    end

    return output
  end
end