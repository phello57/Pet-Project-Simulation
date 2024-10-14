# frozen_string_literal: true

require_relative '../../../../src/game/model/factory/Entity_factory'
require_relative '../../../game/model/game_entities/Tree'

class TreeFactory < EntityFactory
  def create_entity(node)
    Tree.new(node)
  end
end
