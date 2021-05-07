#!/usr/bin/env ruby
##
## EPITECH PROJECT, 2021
## Caesar
## File description:
## Caesar
##

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
