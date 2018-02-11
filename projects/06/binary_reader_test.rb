require './binary_reader.rb'
p "Binary Reader Tests:"

line = "@0"
p "#{BinaryReader.instruction_is_decimal?(line) == true} (returns true when instructions is an int)"
p "#{BinaryReader.translate(line) == "0" && BinaryReader.translate("@21") == "10101"} (BinaryReader translates ints correctly.)"

line = "D=M"
p "#{BinaryReader.instruction_is_decimal?(line) == false} (returns false when instruction is not an int)"

line = "D = D - M"
p "#{BinaryReader.instruction_is_decimal?(line) == false} (ignores whitespace)"