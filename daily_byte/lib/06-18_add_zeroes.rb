# Given an array of integers, nums, duplicate the occurrence of each zero in the array by shifting other non-zero elements to the right.
# Note: The modification to nums must be done in-place, do not return anything from your function, and elements beyond the length of the original array not not written.

# original_last_index = nums.size - 1
# for num, i in nums
#		if num == 0
#			nums.insert(i + 1, 0)
#	nums = nums[0..original_last_index]
# return null

def add_zeroes(nums)
	original_last_index = nums.size - 1
	i = 0
	
	while i <= original_last_index
		if nums[i] == 0
			nums.insert(i + 1, 0)
			i += 2
			nums.pop
		end
		i += 1
	end

	return nums
end

puts("--- TEST 1 ---")
nums = [1, 0, 4, 0, 5, 8]
puts(add_zeroes(nums).inspect)
puts(nums.inspect)
# expect null, but nums == [1,0,0,4,0,0]

puts("--- TEST 2 ---")
nums = [1, 4, 9]
puts(add_zeroes(nums).inspect)
puts(nums.inspect)
# expect null, but nums == [1, 4, 9]
