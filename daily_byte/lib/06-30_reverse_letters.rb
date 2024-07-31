require 'algorithms'
# Given a string s, reverse all of its characters that are letters and return the resulting string.

# use a stack to reverse
# if not a letter: insert 0 into stack, and put char into queue
# loop over stack to pop into string
#   if popping 0, get next value in queue
# return assembled string

def reverse_letters_wrong(s)
  stack = Containers::Stack.new
  queue = Containers::Queue.new

  puts("POPULATE STACK AND QUEUE")
  s.each_char.with_index do |char, i|
    puts("char: #{char} | i: #{i}")
    if /[A-Za-z]/.match(char)
      stack.push(char)
    else
      stack.push(0)
      queue.push(char)
    end
  end

  puts("CREATE ret_string")
  ret_string = ""

  stack.each do |char|
    puts("ret_string: #{ret_string} | char: #{char}")
    if char == 0
      ret_string += queue.pop
    else
      ret_string += char
    end
  end

  return ret_string
end

# Actual answer: reverse letters using two pointer approach instead of stack
# if char != letter: don't swap, increment the ptr where char is not a letter, continue loop
def reverse_letters(s)
  i = 0
  j = s.size - 1
  new_str = s.dup

  while i <= j do
    i_is_letter = new_str[i].match?(/[A-Za-z]/)
    j_is_letter = new_str[j].match?(/[A-Za-z]/)

    if i_is_letter && j_is_letter
      temp = new_str[i]
      new_str[i] = new_str[j]
      new_str[j] = temp

      i += 1
      j -= 1
    elsif !i_is_letter && j_is_letter
      i += 1
    elsif i_is_letter && !j_is_letter
      j -= 1
    else
      i += 1
      j -= 1
    end
  end

  return new_str
end

puts("--- TEST 1 ---")
s = "abc*a"
puts(reverse_letters(s))
# expect "acb*a"

puts("--- TEST 2 ---")
s = "Ab&e]a-Ta"
puts(reverse_letters(s))
# expect "aT&a]e-bA"

puts("--- TEST 3 ---")
s = "ab-cd"
puts(reverse_letters(s))
# expect "dc-ba"

puts("--- TEST 4 ---")
s = "a-bC-dEf-ghIj"
puts(reverse_letters(s))
# expect "j-Ih-gfE-dCba"

puts("--- TEST 5 ---")
s = "Test1ng-Leet=code-Q!"
puts(reverse_letters(s))
# expect "Qedo1ct-eeLg=ntse-T!"

puts("--- TEST 6 ---")
s = "7_28]"
puts(reverse_letters(s))
# expect "7_28]"
