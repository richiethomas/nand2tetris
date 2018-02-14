require './parser.rb'

class CompReader
  def self.translate(line)
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

    return "#{a_bit}#{c_bits}"
  end
end