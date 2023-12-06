# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../app/node'

class NodeTest < Minitest::Test
  describe 'Node' do
    before do
      @node = Node.new(14)
    end
   
    def test_it_exists
      assert_instance_of(Node, @node)
    end
  end
end
