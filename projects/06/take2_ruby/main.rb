require './assembler.rb'

input_file = ARGV[0]

Assembler.new.assemble_from_file(input_file)