require './jump_reader.rb'
require 'byebug'

line = "D=M"
p JumpReader.translate(line) == "000"

line = "MD=D+1"
p JumpReader.translate(line) == "000"