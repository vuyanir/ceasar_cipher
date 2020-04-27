#!/usr/bin/ruby

# User input string and position
# Pass input to cipher method
# loop through each character
  # if letter is alphabet 
    # set identifier if letter is small or uppercase
    # convert to char index
    # sum position with char index
    # while new position is out of alphabet ascii range 
      # subtract 26 until new position is with range
    # append new index to new array
  # else append letter to new array
# convert new array to string
# join array
# print full string

def upper_or_smaller(index)
    if (index >= 65 && index <= 90) 
        return 1
    elsif (index >= 97 && index <= 122)
        return 2
    else
        return 3
    end
end

def within_range(id, new_index)
    if id == 1
        while new_index > 90
            new_index -= 26
        end
    end

    if id == 2
        while new_index > 122
            new_index -= 26
        end
    end

    return new_index
end

def cipher(text, pos)

    new_text_in_byte = []

    text.each_byte{|index|
    
        id = upper_or_smaller(index)

        if id == 1 || id == 2
            new_index = index + pos
            new_index = within_range(id, new_index)
        else
            new_index = index
        end

        new_text_in_byte << new_index
    }

    new_text_array = new_text_in_byte.map{|c| c.chr}

    puts new_text_array.join('')

end

print 'Enter text: '
user_text = gets.chomp()

print 'Enter cipher position: '
cipher_pos = gets.chomp().to_i

cipher(user_text, cipher_pos)