require './dest_reader.rb'

line = ""
p DestReader.translate(line) == "000"

line = "M=0"
p DestReader.translate(line) == "001"

line = "D=0"
p DestReader.translate(line) == "010"

line = "MD=0"
p DestReader.translate(line) == "011"

line = "A=0"
p DestReader.translate(line) == "100"

line = "AM=0"
p DestReader.translate(line) == "101"

line = "AD=0"
p DestReader.translate(line) == "110"

line = "AMD=0"
p DestReader.translate(line) == "111"
