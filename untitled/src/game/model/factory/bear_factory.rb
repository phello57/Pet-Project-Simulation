# frozen_string_literal: true

require_relative '../../../../src/game/model/factory/Entity_factory'
require_relative '../../../game/model/game_entities/Bear'

class BearFactory < EntityFactory
  def create_entity(node)
    Bear.new(node)
  end
end
