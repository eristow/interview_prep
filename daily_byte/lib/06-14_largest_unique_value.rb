# Given an integer array, nums, return the largest unique value in nums.

# largest = -1
# seen_nums = {}
#
#  for num in nums
#   seen_nums[num] += 1
#
# for num in nums
#   if num > largest && seen_nums[num] < 2
#     largest = num
#
# if seen_nums[largest] > 1
#   return -1
# return largest

def largest_unique_value(nums)
  largest = -1
  seen_nums = Hash.new(0)

  for num in nums do
    seen_nums[num] += 1
  end
  
  for num in nums do
    if num > largest && seen_nums[num] < 2
      largest = num
    end
  end

  if seen_nums[largest] > 1
    return -1
  end

  largest
end

puts("--- TEST 1 ---")
nums = [4, 9, 2, 9]
puts(largest_unique_value(nums))
# expect 4

puts("--- TEST 2 ---")
nums = [8, 1, 10, 1, 4, 8, 4, 10] 
puts(largest_unique_value(nums))
# expect -1
