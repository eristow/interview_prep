def two_sum(nums, target)
  # BRUTE FORCE: O(n^2)
  # if nums is empty or target is nil, return []
  # for num in nums (each_with_index)
  #   for next_num in nums (each_with_index)
  #     if num + next_num == target
  #       return [num_index, next_num_index]

  # fastest possible: O(n)
  # for num in nums
  #   if num in map, return [prev_index, num_index]
  #   target - num, store num -> index in map (for O(1) access)

  if nums.nil? || nums.empty? || target.nil?
    return []
  end

  num_map = {}
  nums.each_with_index do |num, index|
    if num_map.has_key?(num)
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

puts("--- TEST 5 ---")
nums_5 = [1, 2, 3]
target_5 = nil
puts(two_sum(nums_5, target_5).inspect)
# expect []

puts("--- TEST 6 ---")
nums_6 = [1, 2, 3]
target_6 = 10
puts(two_sum(nums_6, target_6).inspect)
# expect []
