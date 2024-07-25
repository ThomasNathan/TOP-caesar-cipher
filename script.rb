# caesar_cipher("What a string!", 5)
# "Bmfy f xywnsl!"

# BRAINSTORMING SOLUTIONS

# 1) Make a position hash with keys are numbers and values are the letters
    #  - a: 1, b: 2, etc.
    #
    # Split the string, find the number for each letter and reduce that into a new array...
    #  where all numbers have been increased by "5", and transformed to the new corresponding letter...
    #  then joined back together
    #
    #  challenges to this?
    #   1. keeping the correct capitalization
    #   2. Dealing with spaces
    #   3. Dealing with punctuation
    #   4. Feels like it's going to be lots of code and a little messy

def caesar_cipher(phrase, number)
  position_lower = {}
  position_upper = {}

  counter = 0
  "a".upto("z") do |letter|
    counter += 1
    position_lower[letter] = counter
  end

  counter = 0
  "A".upto("Z") do |letter|
    counter += 1
    position_upper[letter] = counter
  end

  new_phrase = []
  phrase.split("").each do |char|
    if !char.match(/[a-zA-Z]/)
      new_phrase.push(char)
    elsif char == char.upcase
      current = position_upper[char]
      new_num = current + number
      new_num -= 26 if new_num > 26
      position_upper.find { |k, v| new_phrase.push(k) if v == new_num}

    else
      current = position_lower[char]
      new_num = current + number
      new_num -= 26 if new_num > 26
      position_lower.find { |k, v| new_phrase.push(k) if v == new_num}
    end
  end
  new_phrase.join("")
end

caesar_cipher("What a string!", 5)
# "Bmfy f xywnsl!"
