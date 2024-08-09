=begin
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
An input string is valid if:
  Open brackets must be closed by the same type of brackets.
  Open brackets must be closed in the correct order.
  Every close bracket has a corresponding open bracket of the same type.
=end

=begin
use stack
iterate over s
  if char in open_char, push onto stack
  if char in close_char && char matches with stack.next, pop from stack 
return stack.empty?
=end

require 'algorithms'

def is_valid2(s)
  open_chars = ["(", "[", "{"]
  close_chars = [")", "]", "}"]
  stack = Containers::Stack.new

  s.each_char do |char|
    if open_chars.include?(char)
      stack.push(char)
    end

    if close_chars.include?(char)
      index_char = close_chars.index(char)

      if stack.empty? || stack.next != open_chars[index_char]
        return false
      end

      stack.pop
    end
  end

  return stack.empty?
end

def is_valid(s)
  matching_map = {
    ")" => "(",
    "]" => "[",
    "}" => "{",
  }
  stack = Containers::Stack.new

  s.each_char do |char|
    if matching_map.values.include?(char)
      stack.push(char)
    else
      if stack.empty? || stack.next != matching_map[char]
        return false
      end

      stack.pop
    end
  end

  return stack.empty?
end

puts("--- TEST 1 ---")
s = "()"
puts(is_valid(s))
# expect true

puts("--- TEST 2 ---")
s = "()[]{}"
puts(is_valid(s))
# expect true

puts("--- TEST 3 ---")
s = "(]"
puts(is_valid(s))
# expect false

puts("--- TEST 4 ---")
s = "([])"
puts(is_valid(s))
# expect true

puts("--- TEST 5 ---")
s = "]"
puts(is_valid(s))
# expect false

puts("--- TEST 6 ---")
s = "(])"
puts(is_valid(s))
# expect false
