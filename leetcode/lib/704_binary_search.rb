def search(nums, target)
  STDERR.puts("nums: #{nums} | target: #{target}")
  left = 0
  right = nums.size - 1
  mid = -1

  while left <= right do
    mid = left + ((right - left) / 2).floor
    STDERR.puts("left: #{left} | mid: #{mid} | right: #{right}")

    return mid if nums[mid] == target

    if nums[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end

  return -1
end

# O(log n)
# left = 0
# right = nums.size - 1
# mid = left + ((right - left) / 2).floor
# while right >= left
#   mid = left + ((right - left) / 2).floor
#   if mid == target
#     return mid
#   if mid < target
#     left = mid + 1
#   if mid > target
#     right = mid - 1
# return -1

puts("--- TEST 1 ---")
nums = [-1, 0, 3, 5, 9, 12]
target = 9
puts(search(nums, target))
# expect 4

puts("--- TEST 2 ---")
nums = [-1, 0, 3, 5, 9, 12]
target = 2
puts(search(nums, target))
# expect -1