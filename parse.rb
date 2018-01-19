#!/usr/bin/env ruby

class Tape

  def initialize(name="tape.txt", string)
    @name = name
    @string = string
    s_array = string.split('')
    IO.foreach(@name) do |line|
      @c = 0
      @t = 0
      while @t == 0
        if (line[@c] == s_array[0]) && (line[@c + 1] == s_array[1])
          @beg = @c
          @z = 0
          while @z == 0
            if line[@c] == ' ' || line[@c] == /\n/
              File.open("Tape Final.txt", "a") do |myfile|
                myfile.write(line[@beg..(@c - 1)])
                myfile.write "\n"
              end
              @z = 1
            else
              @c += 1
            end
          end
          @t = 1
        else
          @c += 1
        end
      end
    end
  end

end

class Display_line

  def initialize(file)
    @file = file
    first_line = File.open(@file) {|f| f.readline}
    puts "\nHere is the first line of your file for reference:\n#{first_line}"
  end

end

# Main body. Excecuted on start.

puts "\n\nThis script will take a specified file, parse the file for a string, "
puts "then prune the file leaving just the string. You must provide a common thread that "
puts "is shared between each string."
puts "\nThis will output to Tape Final.txt.\n\n\n"

puts "What file would you like to parse? If you do not provide an absolute path, it will assume "
print "the file is in the same directory as the script.\n# "

file = gets.chomp

Display_line.new(file)

puts "Please enter the common thread (i.e. Enter PP if each string you would like to isolate "
print "begins with PP): "
s = gets.chomp
s = s.slice!(0, 2) if s.length > 2

Tape.new(file, s)
