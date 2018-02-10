require './comp_reader.rb'
require 'byebug'

line = "D=M"
p CompReader.extract_comp_from_line(line) == "1110000"

line = "MD=D+1"
p CompReader.extract_comp_from_line(line) == "0011111"