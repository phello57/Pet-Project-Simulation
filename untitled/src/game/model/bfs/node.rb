# frozen_string_literal: true

class Node
  attr_accessor :entity, :val
  attr_reader :relations


  def initialize(val = nil, edges = nil)
    @entity = nil

    if val && edges
      @val = val
      @relations = edges
    else # without Arg
      @relations = []
    end
  end
end
