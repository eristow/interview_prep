"""
Given a string s, return true if it is a palindrome, or false otherwise.
"""

"""
two pointers:
* one pointer at start, second at end
* ensure each letter matches:
    * while l <= r
    * if one pointer is a space, go to next char
    * if letters don't match, return false
* return true at end
* time: O(n/2) -> O(n)
* space: O(1)
"""

from test_utils import test
import re


class Solution:
    def isPalindrome(self, s: str) -> bool:
        # Remove non-alphanum chars from string
        s = re.sub(r"[^a-zA-Z0-9]", "", s).lower()
        # s = "".join(filter(str.isalnum, s)).lower()
        # print(f"new string: {s}")

        l, r = 0, len(s) - 1

        while l <= r:
            if s[l] != s[r]:
                return False

            l = l + 1
            r = r - 1

        return True

    def alphaNum(self, c: str) -> bool:
        return (
            ord("A") <= ord(c) <= ord("Z")
            or ord("a") <= ord(c) <= ord("z")
            or ord("0") <= ord(c) <= ord("9")
        )

    def isPalindromeAlt(self, s: str) -> bool:
        l, r = 0, len(s) - 1

        while l < r:
            while l < r and not self.alphaNum(s[l]):
                l += 1

            while r < l and not self.alphaNum(s[r]):
                r -= 1

            if s[l].lower() != s[r].lower():
                return False

            l, r = l + 1, r - 1

        return True

    def isPalindromeReverse(self, s: str) -> bool:
        newStr = ""

        for char in s:
            if char.isalnum():
                newStr += char.lower()

        return newStr == newStr[::-1]


def main():
    solution = Solution()

    test(1, True, solution.isPalindrome("A man, a plan, a canal: Panama"))
    test(2, False, solution.isPalindrome("race a car"))
    test(3, True, solution.isPalindrome(" "))


if __name__ == "__main__":
    main()