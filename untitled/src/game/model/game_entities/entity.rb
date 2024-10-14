# frozen_string_literal: true

class Entity
  attr_accessor :node
  attr_reader :emoji

  def initialize(node)
    @node = node
    @emoji = nil
  end
end
