# frozen_string_literal: true

require_relative '../../../src/game/model/factory/bear_factory'
require_relative '../../../src/game/model/factory/grass_factory'
require_relative '../../../src/game/model/factory/rock_factory'
require_relative '../../../src/game/model/factory/tree_factory'
require_relative '../../../src/game/model/factory/pig_factory'

require_relative '../../../src/game/service/serivce_random_node'
require '../../../src/game/launch/settings'

class CreateEntities
  def initialize(world)
    @game_map = world
    @service_random = ServiceRandomNode.new(world)
  end

  def create_entities
    create(SETTINGS::SPAWN_BEAR, BearFactory.new)
    create(SETTINGS::SPAWN_PIG, PigFactory.new)
    create(SETTINGS::SPAWN_TREE, TreeFactory.new)
    create(SETTINGS::SPAWN_ROCK, RockFactory.new)
    create(SETTINGS::SPAWN_GRASS, GrassFactory.new)
  end

  def create(count, factory)
    count.times do
      empty_node = @service_random.get
      @game_map.add_entity_to_map(factory.create_entity(empty_node), empty_node)
    end
  end

  def add_entities
    create(SETTINGS::ADDITIONAL_SPAWN_GRASS, GrassFactory.new)
    create(SETTINGS::ADDITIONAL_SPAWN_PIG, PigFactory.new)
  end
end
