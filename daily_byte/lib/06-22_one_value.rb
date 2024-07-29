# Given an array of integers, nums, every value appears three times except one value which only appears once.
# Return the value that only appears once.

# num_count = {} (default 0)
# 1. populate num_count
# for num in nums
# 	num_count[num] += 1
# 2. find count of 1 in num_count
#	return num_count.key(1)

def one_value(nums)
	num_count = Hash.new(0)

	for num in nums do
		num_count[num] += 1
	end

	return num_count.key(1)
end

puts("--- TEST 1 ---")
nums = [1, 2, 2, 2, 3, 3, 3]
puts(one_value(nums))
# expect 1

puts("--- TEST 2 ---")
nums = [3, 3, 2, 5, 2, 2, 5, 3, 9, 5]
puts(one_value(nums))
# expect 9
