# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
# You can return the answer in any order.

=begin
BRUTE FORCE:
time: O(n^2)
memory: O(1)
iterate through nums
  check every subsequent num against curr_num
    see if curr_num + other_num = target, return indexes of [curr_num, other_num] if so

fastest possible:
time: O(n)
memory: O(n)
hash map where key = target - num ; value = index in nums
iterate through nums to create hash map
  if num in hash map, return [hashmap[num], index]
    (num in hash map means we found the solution to prev_num + curr_num = target)
=end

def two_sum(nums, target)
  num_map = {}

  nums.each_with_index do |num, index|
    if num_map.key?(num)
      return [num_map[num], index]
    end

    num_map[(target - num)] = index
  end

  return []
end

puts("--- TEST 1 ---")
nums_1 = [2, 7, 11, 15]
target_1 = 9
puts(two_sum(nums_1, target_1).inspect)
# expect [0, 1]

puts("--- TEST 2 ---")
nums_2 = [3, 2, 4]
target_2 = 6
puts(two_sum(nums_2, target_2).inspect)
# expect [1, 2]

puts("--- TEST 3 ---")
nums_3 = [3, 3]
target_3 = 6
puts(two_sum(nums_3, target_3).inspect)
# expect [0, 1]

puts("--- TEST 4 ---")
nums_4 = []
target_4 = 10
puts(two_sum(nums_4, target_4).inspect)
# expect []

puts("--- TEST 6 ---")
nums_6 = [1, 2, 3]
target_6 = 10
puts(two_sum(nums_6, target_6).inspect)
# expect []
