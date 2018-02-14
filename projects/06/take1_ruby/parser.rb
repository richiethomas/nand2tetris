class Parser
  def self.parse_dest(line)
    return "" unless line.include?("\=")
    eql_index = line.index(/\=/)
    return line[0...eql_index]
  end

  def self.parse_comp(line)
    start_index = line.include?("=") ? line.index(/\=/) + 1 : 0
    end_index = line.include?("\;") ? line.index(/\;/) : -1
    output = line.include?("\;") ? line[start_index...end_index] : line[start_index..end_index]
  end

  def self.parse_jump(line)
    return "" unless line.include?("\;")
    start_index = line.index(/\;/) + 1
    return line[start_index..-1]
  end
end