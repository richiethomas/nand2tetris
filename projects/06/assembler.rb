require 'byebug'

input_file = ARGV[0]
filename_without_suffix = input_file[0..(input_file.rindex /.asm/) - 1]

def read_and_trim_input_file(input_file, &block)
  File.open(input_file, "r") do |read_file|
    read_file.each_line do |line|
      line = line.gsub("\r\n", "")
      next if ["//", ""].include? line.strip[0..1]
      yield "#{line}\n"
    end
  end
end

def send_to_hack_file(output_filename, &block)
  File.open("#{output_filename}.hack", "a") do |output_file|
    begin
      yield output_file
    ensure
      output_file.close
    end
  end
end

def instruction_is_decimal?(instruction)
  instruction[0] == "@" && instruction[1..-1].length > 0 && instruction[1..-1] !~ /\D/
end

#------------------------

read_and_trim_input_file(input_file) do |line|
  send_to_hack_file(filename_without_suffix) do |file|
    # file.write line
    p line
  end
end