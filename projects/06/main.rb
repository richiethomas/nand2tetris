require './assembler.rb'

input_file = ARGV[0]
filename_without_suffix = input_file[0..(input_file.rindex /.asm/) - 1]

Assembler.read_and_trim_input_file(input_file) do |line|
  line = line.chomp
  Assembler.send_to_hack_file(filename_without_suffix) do |file|
    if Parser.instruction_is_decimal?(line)
      output = Translator.convert_number_to_binary(line[1..-1].to_i)
    else
      dest = Translator.extract_dest_from_line(line)
      comp = Translator.extract_comp_from_line(line)
      jump = Translator.extract_jump_from_line(line)

      output = "111#{comp}#{dest}#{jump}"
    end
    file.write "#{output}\n"
  end
end