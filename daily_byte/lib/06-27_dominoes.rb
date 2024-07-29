# You’re given a set of integers, dominoes, that represent a set of domino tiles.
# The value of domino represents either weight and its sign, positive or negative, represents the direction it is falling:
# 	positive falls right and negative falls left.
# When two dominoes collide, the larger domino destroys the smaller domino.
# If two dominoes of the same size collide, both dominoes are destroyed.
# After all the collisions, return the state of the dominoes.

def resolve_dominoes(dominoes)
  # fastest posible: O(n)
  # dominoes_copy = dominoes
  # for each domino
  #   if domino direction and domino in that direction collide, evaluate (separate function)
  # return dominoes_copy
  if dominoes.nil? || dominoes.empty?
    return []
  end

  dominoes_copy = dominoes.dup
  index = 0

  while index < dominoes_copy.size do
    domino = dominoes_copy[index]
    left_domino = nil
    left_domino_index = -1
    right_domino = nil
    right_domino_index = -1

    if domino.negative?
      if index == 0
        index += 1
        next
      end

      left_domino_index = index - 1
      left_domino = dominoes_copy[left_domino_index]
      right_domino_index = index
      right_domino = domino
    else
      if index == dominoes_copy.size - 1
        index += 1
        next
      end

      left_domino_index = index
      left_domino = domino
      right_domino_index = index + 1
      right_domino = dominoes_copy[right_domino_index]
    end

    if !left_domino.negative? && right_domino.negative?
      if left_domino.abs > right_domino.abs
        dominoes_copy.delete_at(right_domino_index)
        index += 1
      elsif left_domino.abs < right_domino.abs
        dominoes_copy.delete_at(left_domino_index)
      elsif left_domino.abs == right_domino.abs
        dominoes_copy.delete_at(left_domino_index)
        dominoes_copy.delete_at(right_domino_index - 1)
      end
    else
      index += 1
    end
  end

  return dominoes_copy
end

puts("--- TEST 1 ---")
dominoes_1 = [3, -3]
puts(resolve_dominoes(dominoes_1).inspect)
# return []

puts("--- TEST 2 ---")
dominoes_2 = [1, 2, -3, 2, -1]
puts(resolve_dominoes(dominoes_2).inspect)
# return [-3, 2]

puts("--- TEST 3 ---")
dominoes_3 = []
puts(resolve_dominoes(dominoes_3).inspect)
# return []

puts("--- TEST 4 ---")
dominoes_4 = [1]
puts(resolve_dominoes(dominoes_4).inspect)
# return [1]

# doesn't resolve as cleanly as TEST 2
puts("--- TEST 5 ---")
dominoes_5 = [1, 2, -3, -2, -1]
puts(resolve_dominoes(dominoes_5).inspect)
# return [-3, -2, -1]
