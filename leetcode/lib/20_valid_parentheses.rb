require 'algorithms'

def valid_paren_pair(char_1, char_2)
  (char_1 == "(" && char_2 == ")") ||
    (char_1 == "[" && char_2 == "]") ||
    (char_1 == "{" && char_2 == "}")
end

def valid_paren(test_string)
  # if test_string empty, return true
  # if test_string nil, return false
  # stack = new stack
  # for char in test_string
  #   if stack.next == char, then stack.pop
  #   else, stack.push(char)
  #
  # if !stack.empty?, return false
  # else return true
  return false if test_string.nil?
  return true if test_string.empty?

  stack = Containers::Stack.new

  test_string.each_char do |char|
    stack_char = stack.next
    if valid_paren_pair(stack_char, char)
      stack.pop
    else
      stack.push(char)
    end
  end

  return false unless stack.empty?

  return true
end

puts("--- TEST 1 ---")
str_1 = "()"
puts(valid_paren(str_1))
# expect true

puts("--- TEST 2 ---")
str_2 = "()[]{}"
puts(valid_paren(str_2))
# expect true

puts("--- TEST 3 ---")
str_3 = "(]"
puts(valid_paren(str_3))
# expect false

puts("--- TEST 4 ---")
str_4 = ""
puts(valid_paren(str_4))
# expect true

puts("--- TEST 5 ---")
str_5 = nil
puts(valid_paren(str_5))
# expect false
