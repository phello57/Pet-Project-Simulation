# frozen_string_literal: true

require_relative '../../../../src/game/model/factory/Entity_factory'
require_relative '../../../game/model/game_entities/Rock'

class RockFactory < EntityFactory
  def create_entity(node)
    Rock.new(node)
  end
end
