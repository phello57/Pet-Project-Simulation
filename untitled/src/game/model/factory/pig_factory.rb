# frozen_string_literal: true

require_relative '../../../../src/game/model/factory/Entity_factory'
require_relative '../../../game/model/game_entities/Pig'

class PigFactory < EntityFactory
  def create_entity(node)
    Pig.new(node)
  end
end
