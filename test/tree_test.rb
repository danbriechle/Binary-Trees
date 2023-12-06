# frozen_string_literal: true

require 'pry'
require 'minitest/autorun'
require_relative '../app/node'
require_relative '../app/tree'

class TreeTest < Minitest::Test
  describe 'Tree' do
    before do
      @ary = [1, 3, 9, 28, 4, 6, 15, 15]
      @tree = Tree.new
      @ary.each { |num| @tree.insert(num) }
    end
  
    def test_it_exists
      assert_instance_of(Tree, @tree)
    end
  
    def test_numbers_can_be_inserted
      assert_equal(@tree.size, @ary.length)
    end
  
    def test_it_can_be_querried
      assert(@tree.contains?(15))
      refute(@tree.contains?(100))
    end

    def test_it_can_be_cleared
      @tree.clear

      assert_equal(@tree.size, 0)
    end

    def test_an_item_can_be_removed
      @tree.remove(28)

      refute(@tree.contains?(28))
    end
  end
end
