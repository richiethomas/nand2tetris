require './parser.rb'
require 'byebug'

line = "@0"
p Parser.instruction_is_decimal?(line) == true

line = "D=M"
p Parser.instruction_is_decimal?(line) == false
p Parser.parse_dest(line) == "D"
p Parser.parse_comp(line) == "M"
p Parser.parse_jump(line) == ""

line = "@1"
p Parser.instruction_is_decimal?(line) == true

line = "D=D-M"
p Parser.instruction_is_decimal?(line) == false
p Parser.parse_dest(line) == "D"
p Parser.parse_comp(line) == "D-M"
p Parser.parse_jump(line) == ""

line = "D;JGT"
# byebug
p Parser.instruction_is_decimal?(line) == false
p Parser.parse_dest(line) == ""
p Parser.parse_comp(line) == "D"
p Parser.parse_jump(line) == "JGT"