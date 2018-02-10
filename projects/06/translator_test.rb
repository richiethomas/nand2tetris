require './translator.rb'
require 'byebug'

line = ""
p Translator.extract_dest_from_line(line) == "000"

line = "D=M"
p Translator.extract_dest_from_line(line) == "010"
p Translator.extract_comp_from_line(line) == "1110000"
p Translator.extract_jump_from_line(line) == "000"