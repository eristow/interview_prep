class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def merge_two_lists(list_1, list_2)
  STDERR.puts("list_2.val: #{list_2.val}")

  if list_1.nil? && list_2.nil?
    STDERR.puts("both nil, return nil")
    return nil
  end

  ret_list_head = ListNode.new
  ret_list_ptr = ret_list_head
  list_1_ptr = list_1
  list_2_ptr = list_2

  while list_1_ptr != nil || list_2_ptr != nil do
    # TODO: extract dupe code to func
    # STDERR.puts("list_1_ptr.val: #{list_1_ptr.val} | list_2_ptr.val: #{list_2_ptr.val}")
    if !list_1_ptr.nil? && list_2_ptr.nil?
      STDERR.puts("list_1 has val, list_2 nil")
      ret_list_ptr.next = ListNode.new(list_1_ptr.val, nil)
      list_1_ptr = list_1_ptr.next
      ret_list_ptr = ret_list_ptr.next
    elsif list_1_ptr.nil? && !list_2_ptr.nil?
      STDERR.puts("list_1 nil, list_2 has val")
      ret_list_ptr.next = ListNode.new(list_2_ptr.val, nil)
      list_2_ptr = list_2_ptr.next
      ret_list_ptr = ret_list_ptr.next
    elsif list_1_ptr.val < list_2_ptr.val
      STDERR.puts("list_1 < list_2")
      ret_list_ptr.next = ListNode.new(list_1_ptr.val, nil)
      list_1_ptr = list_1_ptr.next
      ret_list_ptr = ret_list_ptr.next
    elsif list_2_ptr.val < list_1_ptr.val
      STDERR.puts("list_2 < list_1")
      ret_list_ptr.next = ListNode.new(list_2_ptr.val, nil)
      list_2_ptr = list_2_ptr.next
      ret_list_ptr = ret_list_ptr.next
    elsif list_1_ptr.val == list_2_ptr.val
      STDERR.puts("list_1 == list_2")
      ret_list_ptr.next = ListNode.new(list_1_ptr.val, ListNode.new(list_2_ptr.val, nil))
      list_1_ptr = list_1_ptr.next
      list_2_ptr = list_2_ptr.next
      ret_list_ptr = ret_list_ptr.next.next
    end
  end

  return ret_list_head.next
end

puts("--- Test 1 ---")
list_1_1_2 = ListNode.new(4, nil)
list_1_1_1 = ListNode.new(2, list_1_1_2)
list_1_1 = ListNode.new(1, list_1_1_1)
list_1_2_2 = ListNode.new(4, nil)
list_1_2_1 = ListNode.new(3, list_1_2_2)
list_1_2 = ListNode.new(1, list_1_2_1)
ret_list = merge_two_lists(list_1_1, list_1_2)
ret_list_ptr = ret_list
while ret_list_ptr != nil do
  puts(ret_list_ptr.val)
  ret_list_ptr = ret_list_ptr.next
end
# expect [1, 1, 2, 3, 4, 4]

puts("--- Test 2 ---")
list_2_1 = nil
list_2_2 = nil
puts(merge_two_lists(list_2_1, list_2_2).inspect)
# expect []

puts("--- Test 3 ---")
list_3_1 = nil
list_3_2 = ListNode.new
puts(merge_two_lists(list_3_1, list_3_2).inspect)
# expect [0]

  # if list_1 && list_2 not valid, return nil
  # 
  # ret_list_head = ListNode.new
  # ret_list_ptr = ret_list_head
  # list_1_ptr = list_1
  # list_2_ptr = list_2
  #
  # while not at end of list_1 and list_2
  #   if list_1_ptr < list_2_ptr
  #     add list_1_ptr to ret_list
  #     advance list_1_ptr and ret_list_ptr
  #   elsif list_2_ptr < list_1_ptr
  #     add list_2_ptr to ret_list
  #     advance list_2_ptr and ret_list_ptr
  #   else
  #     add list_1_ptr to ret_list
  #     add list_2_ptr to ret_list
  #     advance list_1_ptr, list_2_ptr and ret_list_ptr
  #
  # return ret_list_head.next
