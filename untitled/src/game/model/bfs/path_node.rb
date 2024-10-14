# frozen_string_literal: true

class PathNode
  attr_accessor :path_node, :pointer_node

  def initialize(pointer_node, path_node)
    @pointer_node = pointer_node
    @path_node = path_node
  end
end
