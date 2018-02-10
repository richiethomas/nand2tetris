require './translator.rb'
require 'byebug'

line = "D=M"
p Translator.extract_jump_from_line(line) == "000"

line = "MD=D+1"
p Translator.extract_jump_from_line(line) == "000"