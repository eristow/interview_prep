class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# recursive approach
# temp = root.left
# left = root.right
# right = temp
# invert(root.left)
# invert(root.right)
# return root

def invert_tree(root)
  STDERR.puts("root.val: #{root.val}") unless root.nil?
  if root.nil? || (root.left.nil? && root.right.nil?)
    STDERR.puts("early return root")
    return root
  end

  STDERR.puts("old left and right: #{root.left.val} | #{root.right.val}")

  temp = root.left
  root.left = root.right
  root.right = temp

  STDERR.puts("new left and right: #{root.left.val} | #{root.right.val}")
  invert_tree(root.left)
  invert_tree(root.right)

  return root
end

puts("--- TEST 1 ---")
right1_3 = TreeNode.new(9, nil, nil)
right1_2 = TreeNode.new(6, nil, nil)
right1_1 = TreeNode.new(7, right1_2, right1_3)
left1_3 = TreeNode.new(3, nil, nil)
left1_2 = TreeNode.new(1, nil, nil)
left1_1 = TreeNode.new(2, left1_2, left1_3)
root1 = TreeNode.new(4, left1_1, right1_1)
puts(invert_tree(root1).inspect)
# expect [4, 7, 2, 9, 6, 3, 1]

puts("--- TEST 2 ---")
right2_1 = TreeNode.new(3, nil, nil)
left2_1 = TreeNode.new(1, nil, nil)
root2 = TreeNode.new(2, left2_1, right2_1)
puts(invert_tree(root2).inspect)
# expect [2, 3, 1]

puts("--- TEST 3 ---")
puts(invert_tree(nil).inspect)
# expect nil
