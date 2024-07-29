# @param {Integer[]} nums
# @return {Integer}
def single_number_hash(nums)
  counts = {}

  for num in nums do
    if counts.has_key?(num)
      counts.delete(num)
    else
      counts[num] = 1
    end
  end

  puts "counts: #{counts.inspect}"
  return counts.keys[0]
end

def single_number_xor(nums)
  count = 0

  for num in nums do
    count = count ^ num
  end

  return count
end
