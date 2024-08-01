=begin

=end

def stone_game_2d(piles)
  dp = Array.new(piles.size){Array.new(piles.size)}
  n = piles.size - 1

  # init dp
  (0..n).each do |i|
    dp[i][i] = piles[i]
  end
  puts("piles: #{piles}")
  puts("dp: #{dp}")

  (1..n).each do |d|
    puts("d: #{d}")
    puts("dp: #{dp}")
    (0..n - d).each do |i|
    puts("i: #{i}")
      choice1 = piles[i] - dp[i + 1][i + d]
      choice2 = piles[i + d] - dp[i][(i + d) - 1]
      puts("choice1: #{choice1} | choice2: #{choice2}")
      dp[i][i + d] = [choice1, choice2].max
      puts("dp[#{i}][#{i + d}]: #{dp[i][i + d]}")
    end
  end

  puts("dp: #{dp}")
  return dp[0][n - 1] > 0
end

# 1D DP instead of 2D
def stone_game(piles)
  dp = piles.dup
  puts("dp: #{dp}")

  (1..piles.size - 1).each do |d|
    puts("d: #{d}")
    (0..(piles.size - 1) - d).each do |i|
      puts("i: #{i}")
      puts("dp: #{dp}")
      choice1 = piles[i] - dp[i + 1] # pick piles[i]
      choice2 = piles[i + d] - dp[i] # pick piles[j] (j = i + d)
      puts("choice1: #{choice1} | choice2: #{choice2}")
      dp[i] = [choice1, choice2].max
      puts("dp[#{i}]: #{dp[i]}")
    end
  end

  return dp[0] > 0
end

puts("--- TEST 1 ---")
piles = [5,3,4,5]
puts(stone_game(piles))
# expect true

puts("--- TEST 2 ---")
piles = [3,7,2,3]
puts(stone_game(piles))
# expect true
