# Implement a method substrings that takes a word as the first argument and then an array of valid substrings
# (your dictionary) as the second argument.  It should return a hash listing each substring (case insensitive)
# that was found in the original string, and how many times it was found.

# example:

# > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# > substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }

# Next, make sure your method can handle multiple words:

# => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
# > substrings("Howdy partner, sit down! How's it going?", dictionary)

# tip: recall how to turn strings into arrays and arrays into strings

########################

# split string into word array
# iterate through word array and create an array of all substrings
# create a hash with keys = to word matches from dictionary and values = count
# compare substring array to dictionary array and add key to hash for matches if
# the key does not exist. If it does exist, add one to the value

# to create substring array, iterate through each word in word array
# for each word, slice words from 1 character to the length of the word characters.
# return a new array with each word's substrings:
# [the, dog] = [t, h, e, th, he, the, d, o, g, do, og, dog]

def word_array(str)
  str.split
end

def all_substrings(arr)
  substrings = []
  arr.each do |word|
    (0...word.length).each do |i|
      (i...word.length).each do |j|
        substrings << word[i..j].downcase
      end
    end
  end
  substrings
end

def create_hsh(words, dictionary)
  word_count = {}
  words.each do |word|
    if dictionary.include?(word)
      if word_count.has_key?(word)
        word_count[word] += 1
      else
        word_count[word] = 1
      end
    end
  end
  word_count
end

def substrings(str, arr)
  words = word_array(str)
  all_words = all_substrings(words)
  create_hsh(all_words, arr)
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("below", dictionary)

p substrings("Howdy partner, sit down! How's it going?", dictionary)