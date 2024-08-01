# You and your friend are playing a game.
# In this game, there are piles of pennies in front of you given by an array piles where piles[i] represents the total number of pennies in the ith pile.
# In this game, you and your friend take turns removing a pile from the beginning or end of piles.
# Once all the pennies are gone, the person who has gathered the most pennies wins.
# Given that you move first, return whether or not you can win assuming that you and your friend are both playing optimally.
# Note: The total number of piles is even, the total number of pennies is odd, and there is always guaranteed to be a winner.

=begin
You will always win...
being greedy doesn't always work. not playing optimally

* explanation to O(1) (return true) solution:
  you can have guaranteed way of picking all even or all odd indexes
    so first figure out max(sum(even), sum(odd)), then pick all evens or all odds
    evens: start at 0, then go to end
    odds: start at end, then go to start

* my start of solution:
  run through playing it
  my_turn = true
  my_score = 0
  friend_score = 0
  while !piles.empty?
    if my_turn
      add max(piles[0], piles[-1]) to my_score, delete max from piles
    else
      add max(piles[0], piles[-1]) to friend_score, delete max from piles
    my_turn = !my_turn
  return my_score > friend_score

* DP solution: O(n^2)
  brute force: O(2^n) solutions you can initially pick
    apply DP (recursive caching) to eliminate repeated work
=end

def penny_picking_not_optimal(piles)
  my_turn = true
  my_score = 0
  friend_score = 0

  while !piles.empty?
    puts("piles: #{piles} | my_turn: #{my_turn} | my_score: #{my_score} | friend_score: #{friend_score}")
    max_pennies = [piles[0], piles[-1]].max
    index_max_pennies = -1

    if piles[0] == max_pennies
      index_max_pennies = 0
    else
      index_max_pennies = piles.size - 1
    end

    puts("max_pennies: #{max_pennies} | index_max_pennies: #{index_max_pennies}")

    if my_turn
      my_score += max_pennies
      piles.delete_at(index_max_pennies)
    else
      friend_score += max_pennies
      piles.delete_at(index_max_pennies)
    end

    my_turn = !my_turn
  end

  puts("piles: #{piles} | my_score: #{my_score} | friend_score: #{friend_score}")
  return my_score > friend_score
end

# Return: max my_total from piles
def dfs(l, r, cache, piles)
  if l > r # base case, can't compute further once gone through piles
    return 0
  end

  if cache.key?([l, r])
    return cache[[l, r]]
  end

  my_turn = (r - l) % 2 ? true : false # my_turn if remaining piles is even
  # 0 because we don't want friend's choices contributing to my_total
  left = my_turn ? piles[l] : 0
  right = my_turn ? piles[r] : 0

  # Pick max of two choices
  # choice 1: dfs(l + 1, r) + left
  # choice 2: dfs(l, r - 1) + right
  left_choice = dfs(l + 1, r, cache, piles) + left
  right_choice = dfs(l, r - 1, cache, piles) + right
  choices = [left_choice, right_choice]
  cache[[l, r]] = my_turn ? choices.max : choices.min

  return cache[[l, r]]
end

def penny_picking(piles)
  cache = {} # subarr piles (l, r) -> Max my_total

  return dfs(0, piles.size - 1, cache, piles) > piles.sum / 2
end

puts("--- TEST 1 ---")
piles = [2, 1, 4, 4]
puts(penny_picking(piles))
# expect true 

puts("--- TEST 2 ---")
piles = [2, 1, 4, 9, 3, 8]
puts(penny_picking(piles))
# expect true 

puts("--- TEST 3 ---")
piles = [2, 1, 8, 4]
puts(penny_picking(piles))
# expect true

puts("--- TEST 4 ---")
piles = [5,3,4,5]
puts(penny_picking(piles))
# expect true

puts("--- TEST 5 ---")
piles = [3,7,2,3]
puts(penny_picking(piles))
# expect true

puts("--- TEST 6 ---")
piles = [3,100,200,3,1]
puts(penny_picking(piles))
# expect true
