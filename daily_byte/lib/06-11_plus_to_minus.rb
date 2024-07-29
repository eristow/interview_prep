# You are playing a game with a friend.
# In this game you’re given a string s and you and your friend take turns making moves.
# A move consists of flipping two consecutive + signs into - signs.
# Given a string s, return a list containing all possible states of s after you’ve made the first move.

# O(n)
# for char in s
#   if at end of s, break
#   if char and char + 1 == +, add mutated s to ret_arr
# return ret_arr

def plus_to_minus(s)
  ret_arr = []

  s.each_char.with_index do |char, index|
    if index == s.size - 1
      break
    end

    if char == "+" && s[index + 1] == "+"
      new_s = s.dup
      new_s[index] = "-"
      new_s[index + 1] = "-"

      ret_arr.push(new_s)
    end
  end

  return ret_arr
end

puts("--- TEST 1 ---")
s = "++"
puts(plus_to_minus(s).inspect)
# expect ["--"]

puts("--- TEST 2 ---")
s = "++++"
puts(plus_to_minus(s).inspect)
# expect ["--++","+--+","++--"]
