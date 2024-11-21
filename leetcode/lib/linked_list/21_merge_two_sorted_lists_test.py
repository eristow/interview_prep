"""
You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.
"""

"""
GENERAL:
two pointers: one at the start of each list
create empty new list

while both pointers are not None:
    take smaller of two pointers (or first pointer if same), and use next of taken pointer
        * specifically:
            

return new list
"""

from typing import Optional


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def print_list(self, list: ListNode) -> None:
        if not list:
            print(f"empty list")
            return

        curr = list
        while curr:
            print(f"curr.val: {curr.val} | curr.next: {curr.next}")
            curr = curr.next

    def merge_two_lists(
        self, list_1: Optional[ListNode], list_2: Optional[ListNode]
    ) -> Optional[ListNode]:
        # Using dummy first node, to avoid initial new_list being None edge case (leading to extra code).
        new_list = ListNode()
        curr_new = new_list

        # Create rest of merged list
        while list_1 and list_2:
            if list_2.val < list_1.val:
                curr_new.next = list_2
                list_2 = list_2.next
            else:
                curr_new.next = list_1
                list_1 = list_1.next

            curr_new = curr_new.next

        # Take the rest of remaining list
        if list_1:
            curr_new.next = list_1
        else:
            curr_new.next = list_2

        return new_list.next

    def merge_two_lists_recurse(
        self, list_1: Optional[ListNode], list_2: Optional[ListNode]
    ) -> Optional[ListNode]:
        if not list_1 or not list_2:
            return list_1 if list_1 else list_2

        if list_1.val > list_2.val:
            list_1 = list_2
            list_2 = list_1

        list_1.next = self.merge_two_lists_recurse(list_1.next, list_2)
        return list_1

    def merge_two_lists_recurse_2(
        self, list_1: Optional[ListNode], list_2: Optional[ListNode]
    ) -> Optional[ListNode]:
        if not list_1:
            return list_2
        if not list2:
            return list_1

        if list_1.val <= list_2.val:
            list_1.next = self.merge_two_lists_recurse_2(list_1.next, list_2)

            return list_1
        else:
            list_2.next = self.merge_two_lists_recurse_2(list_1, list_2.next)

            return list_2


class Tests:
    s: Solution
    test_cases: []

    def __init__(self):
        self.s = Solution()
        self.test_cases = [self.test_1, self.test_2, self.test_3, self.test_4]

    def run_tests(self):
        for i, test in enumerate(self.test_cases):
            print(f"--- TEST {i} ---")
            test()

    def test_1(self):
        """
        Input: list1 = [1,2,4], list2 = [1,3,4]
        Output: [1,1,2,3,4,4]
        """
        list_1_3 = ListNode(4)
        list_1_2 = ListNode(2, list_1_3)
        list_1_1 = ListNode(1, list_1_2)

        list_2_3 = ListNode(4)
        list_2_2 = ListNode(3, list_2_3)
        list_2_1 = ListNode(1, list_2_2)

        merge_list = self.s.merge_two_lists(list_1_1, list_2_1)

        self.s.print_list(merge_list)

    def test_2(self):
        """
        Input: list1 = [], list2 = []
        Output: []
        """
        list_1_1 = None

        list_2_1 = None

        merge_list = self.s.merge_two_lists(list_1_1, list_2_1)

        self.s.print_list(merge_list)

    def test_3(self):
        """
        Input: list1 = [], list2 = [0]
        Output: [0]
        """
        list_1_1 = None

        list_2_1 = ListNode(0)

        merge_list = self.s.merge_two_lists(list_1_1, list_2_1)

        self.s.print_list(merge_list)

    def test_4(self):
        """
        Input: list1 = [2], list2 = [1]
        Output: [1,2]
        """
        list_1_1 = ListNode(2)

        list_2_1 = ListNode(1)

        merge_list = self.s.merge_two_lists(list_1_1, list_2_1)

        self.s.print_list(merge_list)


if __name__ == "__main__":
    tests = Tests()

    tests.run_tests()
