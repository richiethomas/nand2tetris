require './jump_reader.rb'
require 'byebug'

line = "D=M"
p JumpReader.extract_jump_from_line(line) == "000"

line = "MD=D+1"
p JumpReader.extract_jump_from_line(line) == "000"