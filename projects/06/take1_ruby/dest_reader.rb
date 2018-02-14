require './parser.rb'
require './reader.rb'
require 'byebug'

class DestReader < Reader
  def self.translate(line)
    dest = Parser.parse_dest(line)

    return "000" unless dest

    a = dest.include?('A') ? 1 : 0
    m = dest.include?('M') ? 1 : 0
    d = dest.include?('D') ? 1 : 0

    return "#{a}#{d}#{m}"
  end
end