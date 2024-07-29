# Given a string S that contains only lowercase letters, return a list containing the intervals of all the bunches.
# A bunch is a set of contiguous characters (larger than two) that are all the same.
# An interval that represents a bunch contains the starting index of the bunch and the ending index of the bunch.
# Note: The intervals returned should be in ascending order according to start indexes.
# Ex: Given the following string S...

# S = “aaabbbccc”, return [[0,2],[3,5],[6,8]].
# Ex: Given the following string S...

# S = “aaabbcddddd”, return [[0,2],[6,10]].

# NOTES:
# create ans_arr, count, current_char
# for each char in string:
#   if current_char is empty, set it to char
#   else if current_char matches char, increment count
#   else add current bunch to ans_arr (only if > 2), set new current_char, set count to 0

def bunches(str)
  ans_arr = []
  end_index = 0
  start_index = 0
  current_char = ""

  str.split("").each_with_index do |char, i|
    STDERR.puts "char: #{char}"
    if current_char.blank?
      STDERR.puts "setting current char to #{char}"
      current_char = char
      end_index = i
      start_index = i
    elsif current_char == char
      STDERR.puts "incrementing count"
      end_index += 1
    else
      STDERR.puts "reset: #{start_index} #{end_index}"
      if end_index - start_index >= 2
        STDERR.puts "adding bunch to ans_arr"
        ans_arr.append([start_index, end_index])
      end

      end_index = i
      start_index = i
      current_char = char
      STDERR.puts "current start/end indexes: #{start_index} #{end_index}"
    end
  end

  STDERR.puts "remaining bunch: #{start_index} #{end_index}"
  if end_index - start_index >= 2
    STDERR.puts "adding remaining bunch to ans_arr"
    ans_arr.append([start_index, end_index])
  end

  return ans_arr
end

puts bunches("aaabbbccc").inspect
puts bunches("aaabbcddddd").inspect
