require 'active_record'

# NOTES:
# create a map (letter -> count)
# loop over first string:
#   populate map with counts for each letter
# loop over second string:
#   subtract from counts in map
#     if letter count goes to 0, delete from map
#   if letter not in map, return false
# at end: return true if map is empty

# QUESTIONS:
# Do I need to loop over both strings separately?

def valid_anagram(s, t)
  map = {}

  # Create map of counts from string 1
  s.split("").each do |letter|
    if !map.key?(letter)
      map[letter] = 1
    else
      map[letter] += 1
    end
  end

  # Check string 2 against map of counts
  t.split("").each do |letter|
    if !map.key?(letter)
      return false
    elsif map.key?(letter) && map[letter] == 1
      # TODO: delete letter from map
      map.delete(letter)
    else
      map[letter] -= 1
    end
  end


  # Evaluate
  if map.empty?
    return true
  end

  return false
end

# puts valid_anagram("anagram", "nagaram")  # true
# puts valid_anagram("rat", "car")          # false

# puts %w(a b c d e f g).to(2)
