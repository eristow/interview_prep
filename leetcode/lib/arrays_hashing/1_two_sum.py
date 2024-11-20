"""
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.
"""

"""
brute force:
* 2 loops, calculating each sum, exit early when target is found
* time: O(n^2)
* space: O(1)

set:
* store target - initial_num in map (difference -> initial_num)
* then check if any num in nums is a key in map
* time: O(2 * n) -> O(n)
* space: O(n)
"""

from utils import test


class Solution:
    def two_sum(self, nums: list[int], target: int) -> list[int]:
        diffs = {}  # diff -> index

        # for i, num in enumerate(nums):
        #     diffs[target - num] = i

        for i, num in enumerate(nums):
            # Can't use same element twice
            if num in diffs.keys() and i != diffs[num]:
                return [diffs[num], i]

            diffs[target - num] = i

        return []

    def two_sum_one_pass(self, nums: list[int], target: int) -> list[int]:
        prevMap = {}  # val -> index

        for i, n in enumerate(nums):
            diff = target - n

            if diff in prevMap:
                return [prevMap[diff], i]

            prevMap[n] = i


def main():
    solution = Solution()

    test(1, [0, 1], solution.two_sum([2, 7, 11, 15], 9))
    test(2, [1, 2], solution.two_sum([3, 2, 4], 6))
    test(3, [0, 1], solution.two_sum([3, 3], 6))


if __name__ == "__main__":
    main()
