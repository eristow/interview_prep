# if s nil, return false
# if s empty, return true
#
# remove all non-alphanumeric chars and convert to lowercase (built-in ruby methods)
#
# is_valid = true
# ptr_1 = 0
# ptr_2 = s.size - 1
# while ptr_1 != ptr_2
#   if s[ptr_1] != s[ptr_2], return false
#   ptr_1 += 1
#   ptr_2 -= 1
# end
#
# return true if s[ptr_1] == s[ptr_2] && is_valid == true
# return false

def is_palindrome(s)
  return false if s.nil?

  # Remove all non-alphanumeric chars, convert to lowercase, and convert to arr
  test_s = s.gsub(/[^0-9a-z]/i, "").downcase.split("")
  return true if test_s.empty?

  STDERR.puts("test_s: #{test_s}")

  ptr_1 = 0
  ptr_2 = test_s.size - 1

  while ptr_1 != ptr_2 && ptr_1 < ptr_2
    STDERR.puts("ptr_1: #{ptr_1} | ptr_2: #{ptr_2}")
    STDERR.puts("test_s[ptr_1]: #{test_s[ptr_1]} | test_s[ptr_2]: #{test_s[ptr_2]}")
    if test_s[ptr_1] != test_s[ptr_2]
      STDERR.puts("ptr_1 != ptr_2")
      return false
    end

    ptr_1 += 1
    ptr_2 -= 1
  end

  if test_s[ptr_1] == test_s[ptr_2]
    STDERR.puts("palindrome!")
    return true
  end

  return false
end

puts("--- TEST 1 ---")
s = "A man, a plan, a canal: Panama"
puts(is_palindrome(s))
# expect true

puts("--- TEST 2 ---")
s = "race a car"
puts(is_palindrome(s))
# expect false

puts("--- TEST 3 ---")
s = " "
puts(is_palindrome(s))
# expect true

puts("--- TEST 4 ---")
s = nil
puts(is_palindrome(s))
# expect false

puts("--- TEST 5 ---")
s = "aa"
puts(is_palindrome(s))
# expect true

puts("--- TEST 5 ---")
s = "aA"
puts(is_palindrome(s))
# expect true
