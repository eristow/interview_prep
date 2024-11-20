"""
Given two strings s and t, return true if t is an 
anagram of s, and false otherwise.
"""

"""
Add all letters of s into map (letter -> freq)
Iterate over t:
    If letter not in map, return false
    If letter in map, decrement
    If letter in map == 1, remove from map
If map is empty, return True. Else, False.

Time: O(s + t)
Space: O(s)
"""

from utils import test
from collections import defaultdict


class Solution:
    def is_anagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False

        letters = defaultdict(int)

        for letter in s:
            letters[letter] += 1

        for letter in t:
            if letter not in letters:
                return False
            else:
                if letters[letter] == 1:
                    del letters[letter]
                else:
                    letters[letter] -= 1

        if len(letters.keys()) == 0:
            return True
        else:
            return False

    def is_anagram2(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False

        count_s = defaultdict(int)
        count_t = defaultdict(int)

        for i in range(len(s)):
            count_s[s[i]] += 1
            count_t[t[i]] += 1

        return count_s == count_t

    def is_anagram_sort(self, s: str, t: str) -> bool:
        """
        Time: O(s log s + t log t)
        Space: O(1) or O(n + m) (depending on sorting alg)
        """
        if len(s) != len(t):
            return False

        return sorted(s) == sorted(t)


def main():
    solution = Solution()
    test(1, True, solution.is_anagram2("anagram", "nagaram"))
    test(2, False, solution.is_anagram2("rat", "car"))
    test(3, False, solution.is_anagram2("ab", "a"))


if __name__ == "__main__":
    main()
