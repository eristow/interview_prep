"""
Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

You must write an algorithm with O(log n) runtime complexity.
"""

"""
binary search:
* init l = 0, r = len(nums) - 1, m = (r / 2) + l
    * Ex: [1,2,3,4,5] => l = 0, r = 4, m = 2
    * Ex: [1,2,3,4,5,6] => l = 0, r = 5, m = 2
* while l < r:
    * if target > nums[m]:
        * use right side, recalc l,r,m
    * if target < nums[m]:
        * use left side, recalc l,r,m
    * if nums[m] == target: return m
* return -1
"""

from test_utils import test


class Solution:
    def search(self, nums: list[int], target: int) -> int:
        l = 0
        r = len(nums) - 1

        while l <= r:
            m = (l + r) // 2  # can cause overflow in Java/C++ (not in Python)
            # m = ((r - l) // 2) + l  # avoids overflow
            print(f"r - l: {r - l}")
            print(f"(r - l) // 2: {(r - l) // 2}")
            print(f"l: {l} | m: {m} | r:{r}")

            if target > nums[m]:
                print("target > m")
                l = m + 1
            elif target < nums[m]:
                print("target < m")
                r = m - 1
            else:
                print("found")
                return m

        return -1


def main():
    s = Solution()

    test(1, 4, s.search([-1, 0, 3, 5, 9, 12], 9))
    test(2, -1, s.search([-1, 0, 3, 5, 9, 12], 2))
    test(3, 0, s.search([5], 5))
    test(4, 1, s.search([2, 5], 5))


if __name__ == "__main__":
    main()
