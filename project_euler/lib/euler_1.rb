# Find the sum of all multiples of 3 or 5 below 1000
def sum_divisible_by(divisor, target)
  last_digit = target / divisor
  return divisor * (last_digit * (last_digit + 1)) / 2
end

def euler_1_optimal(target)
  return sum_divisible_by(3, target) +
         sum_divisible_by(5, target) -
         sum_divisible_by(15, target)
end

def euler_1()
  sum = 0

  1.upto(999) { |num|
    if num % 3 != 0 && num % 5 != 0
      next
    end

    puts "num: #{num}"

    sum += num
  }

  return sum
end

puts euler_1_optimal(999)
