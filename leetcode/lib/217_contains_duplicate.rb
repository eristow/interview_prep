# Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

# use a hash map
# for num in nums
#		if num in hash: return true
#		else: add num to hash
# return false at end

def contains_duplicate(nums)
	dupes = Hash.new(0)

	for num in nums do
		if dupes.key?(num)
			return true
		else
			dupes[num] += 1
		end
	end

	return false
end

puts("--- TEST 1 ---")
nums = [1,2,3,1]
puts(contains_duplicates(nums))
# expect true

puts("--- TEST 2 ---")
nums = [1,2,3,4]
puts(contains_duplicates(nums))
# expect false

puts("--- TEST 3 ---")
nums = [1,1,1,3,3,4,3,2,4,2]
puts(contains_duplicates(nums))
# expect true
