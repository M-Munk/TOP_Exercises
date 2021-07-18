# create a method that accepts a string and a number shift factor and outputs the modified string
# don't forget to wrap from z to a
# don't forget to keep the same case

# convert string to characters array
# transform array from character to ascii code
# shift ascii code by the shift factor
# if the shift factor causes the character value to be greater than z or Z depending on upper or lower case 
# start over at a or A

# do not transform non-letter characters

# convert ascii value back to characters 
# transform character array into a string
# return the string value as a new string

# a = 97.. z = 122
# A = 65.. Z = 90
# 26 letters

LOWER_CASE = (97..122)
UPPER_CASE = (65..90)
LETTERS = 26

def in_range?(num)
  num <= LETTERS
end

def correct_range(num)
  loop do
    break if in_range?(num)
    num -= LETTERS
  end
  num
end

def valid_letter?(num)
  LOWER_CASE.include?(num) || UPPER_CASE.include?(num)
end

def convert_to_chars(str, change)
  str.chars.map! { |char| char.ord }
end

def convert_to_string(arr)
  string = arr.map { |char| char.chr}
  string.join
end

def shift_chars(arr, change)
  arr.map do |char| 
    if valid_letter?(char)
      char += change
      if valid_letter?(char)
        char
      else
        char -= LETTERS
      end
    else
        char
    end
  end
end


def caesar_shift (str, shift)
  characters = convert_to_chars(str, shift)
  correct_shift = correct_range(shift)
  new_char = shift_chars(characters, correct_shift)
  convert_to_string(new_char)
end

caesar_shift("What a string!", 5)
caesar_shift("Oh, what a beautiful MORNING!", 32)