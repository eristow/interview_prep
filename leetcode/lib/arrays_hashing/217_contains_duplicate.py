"""
Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
"""

from utils import test


class Solution:
    def contains_duplicate(self, nums: list[int]) -> bool:
        duplicates = set()

        for num in nums:
            if num in duplicates:
                return True
            else:
                duplicates.add(num)
        return False


def main():
    solution = Solution()

    test(1, True, solution.contains_duplicate([1, 2, 3, 1]))
    test(2, False, solution.contains_duplicate([1, 2, 3, 4]))
    test(3, True, solution.contains_duplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]))


if __name__ == "__main__":
    main()
