# Given an integer array, nums, return a list containing all subsets of nums that contain at least two elements and have an increasing sequence.

=begin
combinations that increase for each value
backtrack, recursive
use set to track duplicates

take first element, then backtrack(start, current[])
	if current.size > 1
		add to set
	
	last = current[-1] or -999 if current.empty?

	for i from start -> nums.size - 1
		if nums[i] >= last
			add nums[i] to current
			backtrack(i + 1, current)
			remove first elem from current (current.pop)

return set after all backtracking
=end

# USING SET
def backtrack(start, current, ans, nums)
	puts("BACKTRACK: start: #{start} | current: #{current.inspect}")
	if current.size > 1
		puts("add to ans: #{current.inspect}")
		ans.add(current.dup)
	end

	last = current.empty? ? -999 : current[-1]
	puts("last: #{last}")

	puts("nums: #{nums[start..nums.size - 1]}")
	(start..nums.size - 1).each do |i|
		puts("start: #{start} | i: #{i} | nums[i]: #{nums[i]}")
		if nums[i] >= last
			puts("#{nums[i]} >= #{last}. adding #{nums[i]} to #{current.inspect}, backtrack on #{i + 1}, and pop current #{current[0]}")
			current.push(nums[i])
			backtrack(i + 1, current, ans, nums)
			current.pop
		end
	end
end

def bigger_and_bigger(nums)
	ans = Set.new()

	backtrack(0, [], ans, nums)

	return ans.to_a
end

puts("--- TEST 1 ---")
nums = [1, 2, 3]
puts(bigger_and_bigger(nums).inspect)
# expect [[1,2],[1,2,3],[1,3],[2,3]]

puts("--- TEST 2 ---")
nums = [2, 4, 3, 5]
puts(bigger_and_bigger(nums).inspect)
# expect [[2,4],[2,4,5],[2,3],[2,3,5],[2,5],[4,5],[3,5]]

puts("--- TEST 3 ---")
nums = [4, 6, 7, 7]
puts(bigger_and_bigger(nums).inspect)
# expect [[4,6],[4,6,7],[4,6,7,7],[4,7],[4,7,7],[6,7],[6,7,7],[7,7]]

puts("--- TEST 4 ---")
nums = [4, 4, 3, 2, 1]
puts(bigger_and_bigger(nums).inspect)
# expect [[4,4]]
