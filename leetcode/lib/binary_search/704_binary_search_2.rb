=begin
l = 0, r = nums.size - 1, m = right - left / 2
while l <= r && m != target
  if target < m: set l to mid + 1, reset mid to right - left / 2
  if target > m: set r to mid - 1, reset mid to right - left / 2
return mid
=end

def search(nums, target)
  puts("nums: #{nums} | target: #{target}")

  l = 0
  r = nums.length - 1

  while l <= r do
    m = l + ((r - l) / 2)
    puts("l: #{l} | m: #{m} | r: #{r}")

    if target == nums[m]
      return m
    elsif target < nums[m]
      r = m - 1
    else
      l = m + 1
    end
  end

  return -1
end

puts("--- TEST 1 ---")
nums = [-1,0,3,5,9,12]
target = 9
puts(search(nums, target))
# expect 4

puts("--- TEST 2 ---")
nums = [-1,0,3,5,9,12]
target = 2
puts(search(nums, target))
# expect -1

puts("--- TEST 3 ---")
nums = [2,5]
target = 5
puts(search(nums, target))
# expect -1
