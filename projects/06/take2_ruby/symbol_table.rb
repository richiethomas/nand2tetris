require './convert_to_binary.rb'

class SymbolTable
  extend ConvertToBinary

  @table = {}

  def self.parse(line, line_number)
    if line[0] == "("
      return @table[line[1..-2]] = self.pad_binary(line_number)
    else
      return nil
    end
  end

  def self.get_value(key)
    return @table[key]
  end
end