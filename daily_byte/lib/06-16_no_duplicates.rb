# Given a sorted integer array, nums, remove duplicates from the array in-place such that each element only appears once. Once you’ve removed all the duplicates, return the length of the new array.
# Note: The values you leave beyond the new length of the array does not matter.

# seen_nums = {}
# for num in nums
#   if num not in seen_nums
#     seen_nums[num] = 1
#   else
#     remove num from nums
#
# return nums.size

def no_duplicates(nums)
  seen_nums = Hash.new(0)
  index = 0

  while index < nums.size
    num = nums[index]
    if !(seen_nums.key?(num))
      index += 1
    else
      nums.delete_at(index)
    end

    seen_nums[num] += 1
  end

  return seen_nums.size
end

puts("--- TEST 1 ---")
nums = [1, 2, 2, 4, 4, 6, 8, 8]
puts(no_duplicates(nums))
# expect 5

puts("--- TEST 2 ---")
nums = [1, 2, 3, 3]
puts(no_duplicates(nums))
# expect 3

puts("--- TEST 3 ---")
nums = [0, 1, 1, 1, 2, 3]
puts(no_duplicates(nums))
# expect 4
