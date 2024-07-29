# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

# NOTES:
# Start with val = 2 and prev_val = 1
# while val < max, check next val.
# if next_val is even, add to sum.
# if not even, next val.

def euler_2(max)
  total_sum = 2
  val = 2
  prev_val = 2

  while val < max do
    temp_prev = val
    next_val = val + prev_val

    if next_val % 2 == 0
      total_sum += next_val
    end

    val = next_val
    prev_val = temp_prev
  end

  return total_sum
end

puts euler_2(3999999)
