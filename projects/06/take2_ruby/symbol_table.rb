require './convert_to_binary.rb'
require 'byebug'

class SymbolTable
  include ConvertToBinary

  attr_reader :table

  def initialize
    @table = table_presets
  end

  def scan_for_label(line, line_number)
    if line[0] == "("
      @table[line[1..-2]] = pad_binary(line_number)
    else
      return nil
    end
  end

  def get_value(key)
    return @table[key]
  end

  def table_presets
    return {
      "R0": 0,
      "R1": 1,
      "R2": 2,
      "R3": 3,
      "R4": 4,
      "R5": 5,
      "R6": 6,
      "R7": 7,
      "R8": 8,
      "R9": 9,
      "R10": 10,
      "R11": 11,
      "R12": 12,
      "R13": 13,
      "R14": 14,
      "R15": 15,
      "SCREEN": 16384,
      "KBD": 24576,
      "SP": 0,
      "LCL": 1,
      "ARG": 2,
      "THIS": 3,
      "THAT": 4
    }
  end
end