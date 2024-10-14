# frozen_string_literal: true

require_relative '../../../../src/game/model/factory/Entity_factory'
require_relative '../../../game/model/game_entities/Grass'

class GrassFactory < EntityFactory
  def create_entity(node)
    Grass.new(node)
  end
end
