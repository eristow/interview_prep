"""
You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
"""

"""
GENERAL:
buy at lowest, sell at highest
ensure lowest comes before highest

SOLUTION:
store the max profit for each day
    Ex: [7, 1, 5, 3, 6, 4]
        [-1 (day 5), 5 (day 5), 1 (day 5), 3 (day 5), -2 (day 6), 0 (last entry)]
Then pick the max from these stored values
    Ex: [-1 (day 5), 5 (day 5), 1 (day 5), 3 (day 5), -2 (day 6), 0 (last entry)]
        Pick day 2 buy / day 5 sell, return 5.

BRUTE FORCE: (actually don't even need to map for this...)
create map (start_day => max_profit)
for i in range(len(prices)):
    for j in range(len(prices[i:])):
        compare current value of current day to new value
            store it in map if it's larger
return max(map.values)

SLIDING WINDOW:
store cheapest price seen, and max profit
for price in prices:
    IF current price is cheaper, replace cheapest price
        * essentially restarting the window
    ELSE IF (current price - cheapest price) is > max profit, replace max profit
return max profit
* time: O(n)
* space: O(1)

TWO POINTERS:
l, r = 0, 1
max_profit = 0
while r < len(prices):
    if prices[l] < prices[r], see if prices[r] - prices[l] is new max_profit
    else, l = r
    r += 1
return max_profit
"""

import pytest


class Solution:
    def max_profit(self, prices: list[int]) -> int:
        cheapest_price = prices[0]  # starting at beginning
        max_profit = 0  # return 0 if no max_profit

        for price in prices:
            new_profit = price - cheapest_price
            max_profit = max(max_profit, new_profit)
            cheapest_price = min(cheapest_price, price)

        return max_profit

    def maxProfit2(self, prices: list[int]) -> int:
        l, r = 0, 1
        max_profit = 0

        while r < len(prices):
            if prices[l] < prices[r]:
                profit = prices[r] - prices[l]
                max_profit = max(max_profit, profit)
            else:
                l = r
            r += 1

        return max_profit


def test_main():
    s = Solution()

    assert s.max_profit([7, 1, 5, 3, 6, 4]) == 5
    assert s.max_profit([7, 6, 4, 3, 1]) == 0


# if __name__ == "__main__":
pytest.main()
