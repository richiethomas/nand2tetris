class BinaryReader
  def self.translate(line)
    return line[1..-1].to_i.to_s(2)
  end

  def self.instruction_is_decimal?(instruction)
    instruction[0] == "@" && instruction[1..-1].length > 0 && instruction[1..-1] !~ /\D/
  end
end