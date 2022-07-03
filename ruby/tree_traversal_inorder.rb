#require 'pry'
class Node
  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end

def tree_traversal_inorder(root)
  #add values to array from a binary search tree inorder
  array = []  
  return array if root.nil?
  
  stack = [root]
  while !stack.empty?
    #top  => stack[-1]
    if ! stack[-1].left.nil? 
      #cut off left branch path
      #add left branch to top of stack
      #since left branches are smaller dont add any values to array
      left_sub = stack[-1].left
      stack[-1].left = nil
      stack.push(left_sub)
    else  
      #no left branch => smallest value now
      #remove it from stack
      #add it to array 
      popped = stack.pop
      array.push popped.value
      stack.push popped.right if ! popped.right.nil?
    end
  end
  array
end
root = Node.new(2, Node.new(-10), Node.new(20))
puts "Expecting: [-10, 2, 20]"
pp tree_traversal_inorder(root)
if __FILE__ == $PROGRAM_NAME
  #root = Node.new(10, Node.new(0, nil, Node.new(5)), Node.new(20, nil, Node.new(30)))
  #puts "Expecting: [0, 5, 10, 20, 30] "
  #tree_traversal_inorder(root)
  # Don't forget to add your own!
end

# Please add your pseudocode to this file
# And a written explanation of your solution
