# Given an integer, num, return its base seven representation as a string.

def to_base_seven(num)
  new_num = num.dup.to_s(7).to_i

  return new_num
end

puts("--- TEST 1 ---")
num = 42
puts(to_base_seven(num))
# expect 60
