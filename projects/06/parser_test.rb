require './parser.rb'
require 'byebug'


line = "D=M"
p Parser.parse_dest(line) == "D"
p Parser.parse_comp(line) == "M"
p Parser.parse_jump(line) == ""

line = "D=D-M"
p Parser.parse_dest(line) == "D"
p Parser.parse_comp(line) == "D-M"
p Parser.parse_jump(line) == ""

line = "D;JGT"
p Parser.parse_dest(line) == ""
p Parser.parse_comp(line) == "D"
p Parser.parse_jump(line) == "JGT"