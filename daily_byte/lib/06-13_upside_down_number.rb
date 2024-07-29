# Given an string, num that represents the string form of an integer, return whether or not the number looks the same when turned upside-down.

# WRONG
# i = 0
# j = num.length - 1
# while i < j
#   if !((num[i] == "6" && num[j] == "9") || (num[i] == "9" && num[j] == "6") || (num[i] == "2" && num[j] == "5") || (num[i] == "5" && num[j] == "2"))
#     return false
#
# return true

# RIGHT
# valid numbers are 0, 1, 6, 8, 9

def valid_flipped_numbers(num1, num2)
  return (num1 == "6" && num2 == "9") ||
         (num1 == "9" && num2 == "6") || 
         (num1 == "2" && num2 == "5") || 
         (num1 == "5" && num2 == "2")
end

def upside_down_number_wrong(num)
  if num == 0
    return true
  end

  i = 0
  j = num.length - 1

  while i < j
    puts("i: #{i} | j: #{j}")
    if !(valid_flipped_numbers(num[i], num[j]))
      return false
    end

    i += 1
    j -= 1
  end

  return true
end

def upside_down_number(num)
  valid_nums = {
    "0": "0",
    "1": "1",
    "6": "9",
    "8": "8",
    "9": "6"
  }

  left = 0
  right = num.size - 1

  while left <= right
    if valid_nums[num[left].to_sym] != num[right]
      return false
    end

    left += 1
    right -= 1
  end

  return true
end

puts("--- TEST 1 ---")
num = "0"
puts(upside_down_number(num))
# expect true

puts("--- TEST 2 ---")
num = "96"
puts(upside_down_number(num))
# expect true

puts("--- TEST 3 ---")
num = "303821"
puts(upside_down_number(num))
# expect false

puts("--- TEST 4 ---")
num = "01689"
puts(upside_down_number(num))
# expect false

puts("--- TEST 5 ---")
num = "016986910"
puts(upside_down_number(num))
# expect true