require './parser.rb'
require 'byebug'
require './dest_reader.rb'
require './comp_reader.rb'
require './jump_reader.rb'
require './binary_reader.rb'

class Translator
  def self.translate(line)
    line = line.gsub(/\s/, "")
    if BinaryReader.instruction_is_decimal?(line)
      number = BinaryReader.translate(line)
      return "#{'0' * (16 - number.length)}#{number}"
    else
      dest = DestReader.translate(line)
      comp = CompReader.translate(line)
      jump = JumpReader.translate(line)

      return "111#{comp}#{dest}#{jump}"
    end
  end
end