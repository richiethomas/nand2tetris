require './translator.rb'
require 'byebug'

line = "@21"
p "#{Translator.translate(line) == "0000000000010101"} (Handles A-instructions)"

line = "MD=D+1"
p "#{Translator.translate(line) == "1110011111011000"} (Handles C instructions)"

line = "MD = D + 1"
p "#{Translator.translate(line) == "1110011111011000"} (Handles instructions w/ whitespace)"