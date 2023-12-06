# frozen_string_literal: true

class Tree
  attr_accessor :root, :size

  def initialize()
      @root = nil
      @size = 0;
  end

  def insert(value)
    if @root == nil
        @root = Node.new(value)    
    else 
      curr_node = @root
      previous_node = @root
      while curr_node != nil 
        previous_node = curr_node
        if value < curr_node.value 
          curr_node = curr_node.left
        else
          curr_node = curr_node.right
        end
      end
      if value < previous_node.value 
        previous_node.left = Node.new(value)
      else
        previous_node.right = Node.new(value)
      end        
    end
    @size += 1
  end

  def contains?(value, node = self.root)
    if node == nil
      return false
    elsif value < node.value 
      return contains?(value, node.left)
    elsif value > node.value
      return contains?(value, node.right)
    else
      return true
    end  
  end


  def remove(value, node = self.root)    
    removeHelper(value, node = self.root)
    @size -= 1      
    node
  end

  def clear
    self.root = nil
    self.size = 0
  end

  def size
    @size
  end

  private

  def removeHelper(value, node = self.root)
    if node == nil
      return nil
    end
    if node.value > value
      node.left = removeHelper(value, node.left)
    elsif node.value < value
        node.right = removeHelper(value, node.right)
    else
      if node.left != nil && node.right != nil
        temp = node
        min_of_right_subtree = find_min(node.right)
        node.value = min_of_right_subtree.value
        node.right = removeHelper(min_of_right_subtree.value, node.right)
      elsif node.left != nil
        node = node.left 
      elsif node.right != nil
        node = node.right
      else
        node = nil
      end
    end
    return node
  end
end