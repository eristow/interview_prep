# A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward.
# Alphanumeric characters include letters and numbers.
# Given a string s, return true if it is a palindrome, or false otherwise.

=begin
OPTIMAL
ptr_l at start, ptr_r at end

while ptr_l <= ptr_r
  convert chars to lowercase
  if either/both chars non-alphanumeric and ptr_l < ptr_r,
    advance ptr and check again
  return false if s[ptr_l] != s[ptr_r]
  ptr_l += 1
  ptr_r -= 1
return true at the end

time: O(2s * s/2) => O(s)
mem: O(2) => O(1)
=end

def is_palindrome(s)
  ptr_l = 0
  ptr_r = s.length - 1
  not_alphanum_regex = /[^0-9a-zA-Z]/

  while ptr_l <= ptr_r do
    while not_alphanum_regex.match?(s[ptr_l]) && ptr_l < ptr_r do
      ptr_l += 1
    end

    while not_alphanum_regex.match?(s[ptr_r]) && ptr_r > ptr_l do
      ptr_r -= 1
    end

    left_char = s[ptr_l].downcase
    right_char = s[ptr_r].downcase

    if left_char != right_char
      return false
    end

    ptr_l += 1
    ptr_r -= 1
  end

  return true
end

=begin
lowercase all chars
remove all non-alphanumeric chars
reverse s
return s = rev_s

time: O(3s) => O(s)
memory: O(s)
using lots of built-in funcs...
=end

def is_palindrome_2(s)
  s.downcase!
  s.gsub!(/[^0-9a-z]/, '')

  return s == s.reverse
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
