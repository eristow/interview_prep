require 'set'
# Given an integer array, nums, which contains only positive integers, return whether or not nums can be partitioned into two separate subsets such that the sum of the two subsets are equal.

# Thought process: brute force -> caching -> DP
# get sum of entire array, each subset needs to equal total_sum / 2 (target)
# return false if sum isn't whole number?
# decision tree for each num in nums: add num to sum, or not
# store values of backtrack in set, no dupe vals
#		set == list of every sum that can be created from input arr

def equal_share(nums)
	# If total sum is odd, can't have two subsets
	if nums.sum % 2 != 0
		return false
	end

	sum_set = Set.new
	# Add base case of 0
	sum_set.add(0)
	target = nums.sum / 2
	puts(target)

	nums.reverse_each do |num|
		temp_sum_set = sum_set.clone

		for sum in sum_set do
			current_sum = sum + num
			if current_sum == target
				return true
			elsif current_sum < target
				temp_sum_set.add(current_sum)
			end
		end

		sum_set = temp_sum_set
	end

	return true if sum_set.include?(target)
	return false
end

puts("--- TEST 1 ---")
nums = [1, 1, 2]
puts(equal_share(nums))
# expect true

puts("--- TEST 2 ---")
nums = [10, 3, 2]
puts(equal_share(nums))
# expect false

puts("--- TEST 3 ---")
nums = [1, 5, 11, 5]
puts(equal_share(nums))
# expect true

puts("--- TEST 4 ---")
nums = [1, 2, 3, 5]
puts(equal_share(nums))
# expect false
