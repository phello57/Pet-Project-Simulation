# frozen_string_literal: true

class Edge
  attr_reader :pointer_node

  def initialize(pointer_node)
    @pointer_node = pointer_node
  end
end
