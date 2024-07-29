# You are given n pairs of numbers and asked to form a chain.
# Two pairs of numbers can create a link in the chain if the second number in the first pair is less than the first number in the second pair.
# Return the length of the longest chain you can form.
# Note: You may use the pairs of numbers in any order and the first number in a pair is always less than the second number in a pair.

# longest_chain = 0
# for pair, index in pairs
#   if index == pairs.size - 1
#     break
#   if pairs[index][1] < pairs[index + 1][0]
#     longest_chain += 1
# 
# return longest_chain

def max_chain(pairs)
  longest_chain = 0
  current_chain = 0
  pairs.each_with_index do |pair, index|
    puts("pair: #{pair} | index: #{index}")
    if index == pairs.size - 1
      puts("at end of pairs")
      break
    end
    puts("nums: #{pairs[index][1]} | #{pairs[index + 1][0]}")
    puts("nums: #{pairs[index][1] < pairs[index + 1][0]}")
    if pairs[index][1] < pairs[index + 1][0]
      if current_chain == 0
        current_chain = 1
      end
      current_chain += 1
    else
      puts("chains: #{current_chain} | #{longest_chain}")
      if current_chain > longest_chain
        longest_chain = current_chain
        current_chain = 0
      end
    end
  end

  if current_chain > longest_chain
    longest_chain = current_chain
  end

  return longest_chain
end

puts("--- TEST 1 ---")
pairs = [[3,4], [5, 6], [7, 8]]
puts(max_chain(pairs))
# expect 3

puts("--- TEST 2 ---")
pairs = [[9, 14], [3, 4], [5, 7]]
puts(max_chain(pairs))
# expect 2

puts("--- TEST 3 ---")
pairs = [[9, 14], [3, 5], [4, 7]]
puts(max_chain(pairs))
# expect 0
