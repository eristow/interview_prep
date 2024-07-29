# brute force O(n^2)
# for price, index in prices
#   for price2, index2 in prices (next after price/index)
#     calculate difference b/t price and price2 (not abs)
#     if difference is max, store indices of price and price2
# if diff is 0 or negative, return 0
# return max profix

# theoretical fastest O(n)
# cheapest_price = 999999
# max_profit = 0
# for price in prices
#   if price < cheapest_price
#     cheapest_price = price
#   else
#     new_max_profit = price - cheapest_price
#     if new_max_profit > max_profit
#       max_profit = new_max_profit
# return max_profit

def max_profit(prices)
  if prices.nil? || prices.empty?
    return 0
  end

  max_profit = 0
  cheapest_price = 999999 # arbitrarily large num

  for price in prices do
    STDERR.puts("price: #{price}")
    if price < cheapest_price
      STDERR.puts("price #{price} < cheapest_price #{cheapest_price}")
      cheapest_price = price
    else
      new_max_profit = price - cheapest_price
      STDERR.puts("new_max_profit: #{new_max_profit}")
      
      if new_max_profit > max_profit
        STDERR.puts("new_max_profit > max_profit")
        max_profit = new_max_profit
      end
    end

  end

  return max_profit
end

puts("--- TEST 1 ---")
prices = [7, 1, 5, 3, 6, 4]
puts(max_profit(prices))
# expect 5

puts("--- TEST 2 ---")
prices = [4, 1, 5, 2, 7]
puts(max_profit(prices))
# expect 6

puts("--- TEST 3 ---")
prices = [7, 6, 4, 3, 1]
puts(max_profit(prices))
# expect 0

puts("--- TEST 4 ---")
prices = []
puts(max_profit(prices))
# expect 0

puts("--- TEST 5 ---")
prices = nil
puts(max_profit(prices))
# expect 0
