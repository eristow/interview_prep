"""
Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
"""

from test_utils import test


class Solution:
    def containsDuplicate(self, nums: list[int]) -> bool:
        duplicates = set()

        for num in nums:
            if num in duplicates:
                return True
            else:
                duplicates.add(num)
        return False


def main():
    solution = Solution()

    test(1, True, solution.containsDuplicate([1, 2, 3, 1]))
    test(2, False, solution.containsDuplicate([1, 2, 3, 4]))
    test(3, True, solution.containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]))


if __name__ == "__main__":
    main()
