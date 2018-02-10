class BinaryReader
  def self.translate(line)
    return line[1..-1].to_i.to_s(2)
  end
end