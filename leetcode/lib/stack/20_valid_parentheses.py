"""
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.
3. Every close bracket has a corresponding open bracket of the same type.
"""

"""
Stack:
* stack for storing current parens
* for each char in s:
    * if opening char, add to stack
    * if closing char, pop from stack
        * if nothing to pop, return false
* return true if stack
* time: O(n)
* space: O(n)
"""

from utils import test


class Solution:
    opening_chars = ["(", "[", "{"]
    closing_chars = [")", "]", "}"]

    def is_matching(self, opening: str, closing: str) -> bool:
        return (
            (opening == "(" and closing == ")")
            or (opening == "[" and closing == "]")
            or (opening == "{" and closing == "}")
        )

    def is_valid(self, s: str) -> bool:
        stack = []

        for char in s:
            if char in self.opening_chars:
                stack.append(char)
            elif char in self.closing_chars:
                if not stack:
                    return False

                if not self.is_matching(stack.pop(), char):
                    return False

        if not stack:
            return True
        return False

    def is_valid_alt(self, s: str) -> bool:
        closeToOpen = {
            ")": "(",
            "]": "[",
            "}": "{",
        }
        stack = []

        for c in s:
            if c in closeToOpen.keys():
                if stack and stack[-1] == closeToOpen[c]:
                    stack.pop()
                else:
                    return False
            else:
                stack.append(c)

        return True if not stack else False


def main():
    s = Solution()
    test(1, True, s.is_valid("()"))
    test(2, True, s.is_valid("()[]{}"))
    test(3, False, s.is_valid("(]"))
    test(4, True, s.is_valid("([])"))
    test(5, False, s.is_valid("(])]"))


if __name__ == "__main__":
    main()
