# Given an integer array, nums, return the length of the longest increasing subarray.
# Note: The subarray must be strictly increasing.

=begin
counter = 0
prev_num = -999
for num in nums
  if num == nums[0]: continue
  if num > prev_num: counter++
  else: counter = 0
  prev_num = num
return counter
=end

# ONLY WORKS FOR CONSECUTIVE
def length_of_increase_consecutive(nums)
  counter = 1
  max_count = 1

  nums.each_with_index do |num, index|
    unless num == nums[0]
      if num > nums[index - 1]
        counter += 1
      else
        if counter > max_count
          max_count = counter
        end

        counter = 1
      end
    end
  end

  if counter > max_count
    max_count = counter
  end

  return max_count
end


=begin
Ideas:
LIS = longest increasing subsequence
  * brute force using DFS: O(2^n)
    * choice for each value: include or don't include in subseq
  * DFS with Cache: 
    * go through DFS decision tree, working backwards to develop cache?
    * end cases:
      * if next elem is the end and less than current elem
      * current elem is the end
    * example use of cache for [1,2,4,3]
      * LIS[index = 3] = 1 (no more indexes after 3)
      * LIS[index = 2] = 1 (since 3 comes after 4 in array)
      * LIS[index = 1] = 2 (can only add either 4 or 3, but not both)
      * LIS[index = 0] = 3 (can add 2, and either 4 or 3)
      * then take max of these values
  * DP: O(n^2) (because it's each value after the current ones)
    * start at last index, work backwards (base case)
      * Using above example: LIS[3] = 1
    * next index: max(1, 1 + LIS[3]) (only if nums[2] < nums[3])
    * continuing: max(1, 1 + LIS[2], 1 + LIS[3]) (only if nums[1] < nums[2] && nums[1] < nums[3])
    * finally, the first index: max(1, 1 + LIS[1], 1 + LIS[2], 1 + LIS[3]) (ditto from above)
=end
# TODO: implement the DFS ideas in above comment for practice?
# TODO: get O(n * log(n)) solution using greedy binary search
def length_of_increase(nums)
  memo = Hash.new(1)
  i = nums.size - 1

  while i >= 0 do
    (i + 1..nums.size - 1).each do |j|
      if nums[i] < nums[j]
        memo[i] = [memo[i], 1 + memo[j]].max
      end
    end

    i -= 1
  end
  
  return 1 if memo.empty?
  return memo.values.max
end

puts("--- TEST 1 ---")
nums = [1, 2, 3]
puts(length_of_increase(nums))
# expect 3

puts("--- TEST 2 ---")
nums = [3, 4, 1, 2, 8]
puts(length_of_increase(nums))
# expect 3

puts("--- TEST 3 ---")
nums = [1, 3, 5, 4, 7]
puts(length_of_increase(nums))
# expect 4

puts("--- TEST 4 ---")
nums = [2, 2, 2, 2, 2]
puts(length_of_increase(nums))
# expect 1

puts("--- TEST 5 ---")
nums = [1, 3, 5, 7]
puts(length_of_increase(nums))
# expect 4

puts("--- TEST 6 ---")
nums = [10,9,2,5,3,7,101,18]
puts(length_of_increase(nums))
# expect 4

puts("--- TEST 7 ---")
nums = [0,1,0,3,2,3]
puts(length_of_increase(nums))
# expect 4

puts("--- TEST 8 ---")
nums = [7,7,7,7,7,7,7]
puts(length_of_increase(nums))
# expect 1
