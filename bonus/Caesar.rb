#!/usr/bin/env ruby
##
## EPITECH PROJECT, 2021
## Caesar
## File description:
## Caesar
##

#classes

class Error

    def initialize(string)
        @string = string
    
    end

    def is_number?
        true if Float(@string) rescue false
    end
    def validate
        chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + (' '..' ').to_a
        @string.chars.detect {|ch| !chars.include?(ch)}.nil?
    end

end 

class Caesar

#initialize class
  def initialize(shift)
    @shift = shift

  end

##encrypt part
  def encrypt( text)
    
    result = ""
## transform char into corresponding ascii int 
    letter_a = 'A'.ord
    offset = ('z'.ord - 'A'.ord) + 1
## sentence loop
    for i in text.split("")
        
        if i != ' '
## diff between i and 'A'          
          diff_i_a = i.ord - letter_a
## add the shift to the diff 
          shiftedchar = diff_i_a + @shift

# manage min          
          shiftedcharOff = shiftedchar % offset
          
          transformedChar = letter_a + shiftedcharOff
          transformedChar = transformedChar.chr
        else transformedChar = ' '
        end 
        result += transformedChar
    end
    return result
  end
# decrypt part which is the inverse of encrypt  
  def decrypt( encrypt)
    @shift = @shift * -1
    encrypt( encrypt)
  end
  
end

if ARGV[0] == "-h"
    puts("USAGE")
    puts("\t./RubyCaesar str n s\n\n")
    puts("DESCRIPTION")
    puts("\tn\tstring to be encrypted or decryped")
    puts("\tn\t0 for encrypt, 1 for decrypt")
    puts("\tn\t0 for encrypt, 1 for decrypt")
    puts("\tn\tshift (optionnal), 21 by default")
    exit()
end


text = ARGV[0]

errorStr = Error.new(ARGV[0])
errorNb = Error.new(ARGV[1])
#checking errors
(ARGV.length != 3 && ARGV.length != 2)? exit(84): true 
if ((!errorNb.is_number?) || (ARGV[1].to_i > 1) || ((ARGV[1].to_i).negative?) || (!errorStr.validate && ARGV[1].to_i == 0))
    exit (84)
end

#print result

puts "text: #{text}"

if (ARGV.length == 3)
caesar = Caesar.new(ARGV[2].to_i)
else caesar = Caesar.new(21)
end
cipherText = caesar.encrypt( text)
if (ARGV[1] == "0")
puts "Ciphered text: #{cipherText}"
elsif (ARGV[1] == "1")
puts "Deciphered text: #{caesar.decrypt( text)}"
end
