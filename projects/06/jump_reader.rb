require './parser.rb'

class JumpReader
  def self.translate(line)
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