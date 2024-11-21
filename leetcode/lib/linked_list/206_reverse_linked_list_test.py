"""
Given the head of a singly linked list, reverse the list, and return the reversed list.
"""

"""
GENERAL (iterative):
create copy of head where next == None
then, while current != None:
    copy current node, assign copy.next to previous copied node, set previous to current
return previous node
* time: O(n)
* space: O(n)

"""

import pytest
from typing import Optional


class ListNode:
    def __init__(self, val: int = 0, next: Optional[any] = None):
        self.val = val
        self.next = next


class Solution:
    def reverse_list(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if not head:
            return None

        copy_list = ListNode(head.val)
        current = head.next
        print(f"copy_list start: {copy_list.val} | {copy_list.next}")

        while current:
            print(f"copy_list loop: {copy_list.val} | {copy_list.next}")
            copy_node = ListNode(current.val, copy_list)
            copy_list = copy_node
            current = current.next

        travel = copy_list
        while travel:
            print(f"copy_list final: {travel.val} | {travel.next}")
            travel = travel.next

        return copy_list

    # Better mem usage b/c no copy list
    def reverse_list_iter_2(self, head: Optional[ListNode]) -> Optional[ListNode]:
        prev = None
        current = head

        while current:
            next_node = current.next
            current.next = prev
            prev = current
            curr = next_node

        return prev

    def reverse_list_recur(self, head: Optional[ListNode]) -> Optional[ListNode]:
        # Case where list is null
        if not head:
            return None

        # Case where list is one node
        if not head.next:
            return head

        # Second node is the last after reversing
        second_node = head.next

        # Unlink list to prevent cycle
        head.next = None

        # Reverse everything from the second node on
        reverse_rest = self.reverse_list_recur(second_node)

        # Join the two lists
        second_node.next = head

        return reverse_rest


s = Solution()


def test_1():
    # Arrange
    list_1_5 = ListNode(5)
    list_1_4 = ListNode(4, list_1_5)
    list_1_3 = ListNode(3, list_1_4)
    list_1_2 = ListNode(2, list_1_3)
    list_1_1 = ListNode(1, list_1_2)
    list_rev_1_5 = ListNode(1)
    list_rev_1_4 = ListNode(2, list_rev_1_5)
    list_rev_1_3 = ListNode(3, list_rev_1_4)
    list_rev_1_2 = ListNode(4, list_rev_1_3)
    list_rev_1_1 = ListNode(5, list_rev_1_2)
    travel_expected = list_rev_1_1
    print(f"expected: {travel_expected}")

    # Act
    actual_1 = s.reverse_list(list_1_1)
    travel_actual = actual_1
    print(f"actual: {travel_actual}")

    # Assert
    assert travel_actual != None
    while travel_actual != None and travel_expected != None:
        print(f"actual: {travel_actual.val} | expected: {travel_expected.val}")
        assert travel_actual.val == travel_expected.val
        travel_actual = travel_actual.next
        travel_expected = travel_expected.next


def test_2():
    # Arrange
    list_2_2 = ListNode(2)
    list_2_1 = ListNode(1, list_2_2)
    list_rev_2_2 = ListNode(1)
    list_rev_2_1 = ListNode(2, list_rev_2_2)
    travel_expected = list_rev_2_1
    print(f"expected: {travel_expected}")

    # Act
    actual_2 = s.reverse_list(list_2_1)
    travel_actual = actual_2
    print(f"actual: {travel_actual}")

    # Assert
    assert travel_actual != None
    while travel_actual != None and travel_expected != None:
        print(f"actual: {travel_actual.val} | expected: {travel_expected.val}")
        assert travel_actual.val == travel_expected.val
        travel_actual = travel_actual.next
        travel_expected = travel_expected.next


def test_3():
    # Arrange
    expected = None
    print(f"expected: {expected}")

    # Act
    actual = s.reverse_list(None)
    print(f"actual: {actual}")

    # Assert
    assert actual == expected
