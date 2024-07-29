require 'set'
# Given an integer array, nums, which contains only positive integers, return whether or not nums can be partitioned into two separate subsets such that the sum of the two subsets are equal.

# get sum of entire array, each subset needs to equal total_sum / 2 (target)
# return false if sum isn't whole number?
# decision tree for each num in nums: add num to sum, or not
# store in set

def equal_share(nums)
	return nums
end

puts("--- TEST 1 ---")
nums = [1, 1, 2]
puts(equal_share(nums))
# expect true

puts("--- TEST 2 ---")
nums = [10, 3, 2]
# puts(equal_share(nums))
# expect false

puts("--- TEST 3 ---")
nums = [1, 5, 11, 5]
# puts(equal_share(nums))
# expect true

puts("--- TEST 4 ---")
nums = [1, 2, 3, 5]
# puts(equal_share(nums))
# expect false
