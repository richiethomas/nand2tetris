require 'byebug'

input_file = ARGV[0]
filename_without_suffix = input_file[0..(input_file.rindex /.asm/) - 1]

File.open("#{filename_without_suffix}.hack", "w") do |output_file|
  begin
    File.open(input_file, "r") do |read_file|
      read_file.each_line do |line|
        line = line.gsub("\r\n", "")
        next if ["//", ""].include? line.strip[0..1]
        output_file.write "#{line}\n"
      end
    end
  ensure
    output_file.close
  end
end