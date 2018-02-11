require './comp_reader.rb'
require 'byebug'

line = "D=M"
p CompReader.translate(line) == "1110000"

line = "MD=D+1"
p CompReader.translate(line) == "0011111"